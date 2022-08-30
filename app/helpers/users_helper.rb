module UsersHelper

  def signed_in?
    return cookies[:token].nil?
    false
  end
end
