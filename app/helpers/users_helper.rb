module UsersHelper

  def signed_in?
    return cookies[:pquiz_token].nil?
    false
  end
end
