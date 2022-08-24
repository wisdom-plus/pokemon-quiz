class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.correct = params[:answer][:poke_name] === @answer.content ? true : false
    if @answer.save
      redirect_to quizzes_result_path
    else
      redirect_to root_path
    end
  end


  private
  def answer_params
    params.require(:answer).permit(:content,:poke_id)
  end
end
