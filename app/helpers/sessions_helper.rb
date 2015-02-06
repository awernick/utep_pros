module SessionsHelper
  require 'savon'

  def current_user
    return User.first if Rails.env.development? 

    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    # return true if Rails.env.development?

    !current_user.nil? && UTEPSSO.authenticated?(cookies[:UTEP_SE], cookies[:UTEP_SA])
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
