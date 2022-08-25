class QuizzesController < ApplicationController

  def index
    @answer = Answer.new
    @pokemon = Pokemon.new(randam_poke_id)
    redirect_to root_path unless @pokemon.fetch
  end

  def result
    @answer = Answer.last
    poke = Poke.new(@answer.poke_id)
    begin
      @pokemon = poke.get_pokemon_data
      @pokemon_name = poke.get_pokemon_jp_name
    rescue => e
      redirect_to root_path
    end
  end

  private

  def randam_poke_id
    rand(1...905)
  end
end
