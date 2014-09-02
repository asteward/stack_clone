class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to signup_path, notice: "Logged in!"
    else
      flash.now.alert = "Name or password is invalid"
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end