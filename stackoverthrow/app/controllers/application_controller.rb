class ApplicationController < ActionController::Base
  protect_from_forgery

  def logged_in?
    !!session[:id]
  end

  def current_user
    User.find(session[:id])
  end
end
