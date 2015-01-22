class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username params[:username]

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have successfully logged in!"
      redirect_to root_path
    else
      flash[:error] = "There is something wrong with your username or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Until next time friend."
    redirect_to root_path
  end
end