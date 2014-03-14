class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect_to root_path
    else
      render 'users/new'
    end
  end

  def show
    redirect_to new_user_path unless session[:id]
    @user = User.find(params[:id])
  end

end