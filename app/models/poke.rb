class Poke
  def initialize(id)
    @poke_id = id
    @uri = URI.parse('https://pokeapi.co')
  end

  def get_pokemon_data
    http_client = client
    get_request = Net::HTTP::Get.new("/api/v2/pokemon/#{@poke_id}", 'Content-Type' => 'application/json')
    response = http_client.request(get_request)@pokemon_name = JSON.parse(name_response.body)
    @pokemon = JSON.parse(response.body)
  end

  def get_pokemon_jp_name
    http_client = client
    name_request = Net::HTTP::Get.new("/api/v2/pokemon-species/#{@poke_id}", 'Content-Type' => 'application/json')
    name_response = http_client.request(name_request)
    @pokemon_name = JSON.parse(name_response.body)
  end

  private

  def client(uri = @uri)
    http_client = Net::HTTP.new(uri.host,uri.port)
    http_client.use_ssl = true
    hattp_client
  end
end
