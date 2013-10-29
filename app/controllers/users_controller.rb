class UsersController < ApplicationController

  def new

  end

  def create
    user = User.create(params[:user])
    session[:user_id] = user.id
    redirect_to root_path
  end

end