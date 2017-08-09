class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_user!

  helper_method :current_user

  def set_user!
    if cookies.signed[:user_cookie].blank?
      user_cookie = SecureRandom.uuid
      cookies.signed.permanent[:user_cookie] = user_cookie
      @current_user = User.create(user_cookie: user_cookie)
    else
      @current_user = User.find_by(user_cookie: cookies.signed[:user_cookie])
      @current_user = User.create(user_cookie: user_cookie) if @current_user.nil?
    end
  end

  def current_user
    @current_user
  end

end
