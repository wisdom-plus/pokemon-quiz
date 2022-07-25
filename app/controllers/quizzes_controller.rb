require 'net/http'

class QuizzesController < ApplicationController

  def index
    poke_id = rand(1...905)
    uri = URI.parse('https://pokeapi.co')
    get_request = Net::HTTP::Get.new("/api/v2/pokemon/#{poke_id}", 'Content-Type' => 'application/json')
    name_request = Net::HTTP::Get.new("/api/v2/pokemon-species/#{poke_id}", 'Content-Type' => 'application/json')
    http_client= Net::HTTP.new(uri.host,uri.port)
    http_client.use_ssl = true
    response = http_client.request(get_request)
    name_response = http_client.request(name_request)
    @pokemon = JSON.parse(response.body)
    @pokemon_name = JSON.parse(name_response.body)


  end

  def result
  end
end
