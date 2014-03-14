class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user
      session[:id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to new_user_path
  end
end