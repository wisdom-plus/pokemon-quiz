class ApplicationController < ActionController::Base
  private

    def current_user
      return nil unless cookies[:pquiz_token]

      User.find_by(token: cookies[:pquiz_token])
    end

    def authenticate_user
      unless current_user
        redirect_to root_path, alert: 'ユーザーを作成してください'
      end
    end
end
