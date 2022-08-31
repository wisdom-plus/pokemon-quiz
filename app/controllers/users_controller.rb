class UsersController < ApplicationController
  before_action :user_exist?

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      cookies.permanent[:pquiz_token] = user.token
      redirect_to quizzes_path
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end

    def user_exist?
      return redirect_to root_path, alert: 'ページを表示することができません。' if current_user
    end
end
