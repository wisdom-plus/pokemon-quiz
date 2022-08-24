class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to quizzes_result_path
    else
      redirect_to root_path
    end
  end
end
