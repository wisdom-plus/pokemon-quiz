class Client

  def initialize
    @uri = URI.parse('https://pokeapi.co')
  end

  def pokemon_response(id)
    get_request = Net::HTTP::Get.new(pokemon_url(id), 'Content-Type' => 'application/json')
    client.request(get_request)
  end

  def name_response(id)
    request = Net::HTTP::Get.new(pokemon_species_url(id), 'Content-Type' => 'application/json')
    client.request(request)
  end

  private

  def client
    http_client = Net::HTTP.new(@uri.host,@uri.port)
    http_client.use_ssl = true
    http_client
  end

  def pokemon_url(id)
    "/api/v2/pokemon/#{id}"
  end

  def pokemon_species_url(id)
    "/api/v2/pokemon-species/#{id}"
  end

end
