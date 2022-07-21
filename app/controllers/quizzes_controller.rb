require 'net/http'

class QuizzesController < ApplicationController

  def index
    uri = URI.parse('https://pokeapi.co')
    get_request = Net::HTTP::Get.new('/api/v2/pokemon/1', 'Content-Type' => 'application/json')
    http_client= Net::HTTP.new(uri.host,uri.port)
    http_client.use_ssl = true
    response = http_client.request(get_request)
    @pokemon = JSON.parse(response.body)


  end

  def result
  end
end
