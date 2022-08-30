class ApplicationController < ActionController::Base
  private

    def current_user
      return nil unless cookies[:token]

      User.find_by(token: cookies[:token])
    end
end
