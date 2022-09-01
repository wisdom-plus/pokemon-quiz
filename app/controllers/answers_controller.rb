class AnswersController < ApplicationController
  before_action :authenticate_user

  def create
    @answer = current_user.answers.new(answer_params)
    if @answer.save
      redirect_to result_quizzes_path
    else
      redirect_to root_path
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :poke_id, :poke_name)
    end
end
