module UsersHelper
  def signed_in?
    cookies[:pquiz_token].nil?
  end
end
