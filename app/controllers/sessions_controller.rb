class SessionsController < ApplicationController

  def create
    user = User.where(email: params[:email]).first
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render status: 401, text: "<h1>401 Unauthorized</h1><br><br>Email or password incorrect."
    end
  end

  def destroy
    if current_user.id == params[:id]
      session.clear
    end
    redirect_to root_path
  end
end
