class ApplicationController < ActionController::Base
  private

    def current_user
      return nil unless cookies[:pquiz_token]

      User.find_by(token: cookies[:pquiz_token])
    end
end
