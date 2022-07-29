class QuizzesController < ApplicationController

  def index
    poke_id = rand(1...905)
    poke = Poke.new(poke_id)
    @pokemon = poke.get_pokemon_data
    @pokemon_name = poke.get_pokemon_jp_name
  end

  def result
  end
end
