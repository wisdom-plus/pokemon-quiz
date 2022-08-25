class Poke
  include ActiveModel::Model

  attr_reader :data

  def initialize(id)
    @poke_id = id
    @uri = URI.parse('https://pokeapi.co')
    @data = nil
  end

  def get_pokemon_data
    get_request = Net::HTTP::Get.new("/api/v2/pokemon/#{@poke_id}", 'Content-Type' => 'application/json')
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
    name_request = Net::HTTP::Get.new("/api/v2/pokemon-species/#{@poke_id}", 'Content-Type' => 'application/json')
    name_response = client.request(name_request)
    pokemon_name = JSON.parse(name_response.body)['names'].find { |name| name['language']['name'] == 'ja' }['name']
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
end
