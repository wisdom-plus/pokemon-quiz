class AnswersController < ApplicationController
  before_action :authenticate_user

  def create
    @answer = current_user.answers.new(answer_params)
    if @answer.save
      redirect_to result_quizzes_path
    else
      @pokemon = Pokemon.new(@answer.poke_id)
      return redirect_to root_path unless @pokemon.fetch
      flash.now[:alert] = '入力に誤りがあります'
      render 'quizzes/index', status: :unprocessable_entity
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :poke_id, :poke_name)
    end
end
