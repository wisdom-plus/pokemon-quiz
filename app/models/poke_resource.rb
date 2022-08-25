class PokeResource
  include ActiveModel::Model

  attr_reader :data

  def initialize(id)
    @poke_id = id
    @uri = URI.parse('https://pokeapi.co')
    @data = nil
  end

  def get_pokemon_data
    get_request = Net::HTTP::Get.new(pokemon_url, 'Content-Type' => 'application/json')
    response = client.request(get_request)
    begin
      response.value
    rescue => e
      errors.add(:base, '通信に失敗しました')
      Rails.logger.error e.full_message
    end

    return data_parse(response.body) if response.code === '200'

    false
  end

  def get_pokemon_jp_name
    request = Net::HTTP::Get.new(pokemon_species_url, 'Content-Type' => 'application/json')
    response = client.request(request)
    begin
      response.value
      JSON.parse(response.body)['names'].find { |name| name['language']['name'] == 'ja' }['name']
    rescue => e
      errors.add(:base, '通信に失敗しました')
      Rails.logger.error e.full_message
      false
    end
  end

  private

  def client(uri = @uri)
    http_client = Net::HTTP.new(uri.host,uri.port)
    http_client.use_ssl = true
    http_client
  end

  def data_parse(data)
    @data = JSON.parse(data).deep_symbolize_keys
    true
  end

  def pokemon_url
    "/api/v2/pokemon/#{@poke_id}"
  end

  def pokemon_species_url
    "/api/v2/pokemon-species/#{@poke_id}"
  end
end
