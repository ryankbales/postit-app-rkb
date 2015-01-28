class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def show

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You are registered!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your Profile Was Updated"
      redirect_to user_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end