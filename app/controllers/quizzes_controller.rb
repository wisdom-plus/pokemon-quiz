class QuizzesController < ApplicationController
  before_action :authenticate_user

  def index
    @answer = Answer.new
    @pokemon = Pokemon.new(randam_pokemon_id)
    redirect_to root_path unless @pokemon.fetch
  end

  def result
    @answer = Answer.last
    @pokemon = Pokemon.new(@answer.poke_id)
    redirect_to root_path unless @pokemon.fetch
  end

  private

    def randam_pokemon_id
      rand(1...905)
    end
end
