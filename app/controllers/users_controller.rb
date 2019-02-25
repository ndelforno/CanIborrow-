class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.address = params[:user][:address]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      session[:user_id] = @user.id
      redirect_to request.referer, notice: "Logged in as #{@user.email}!"
    else
      redirect_to request.referer, notice: "signup failed !"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.address = params[:user][:address]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      redirect_to user_path(@user)
    end 
  end

  def show
    @user = User.find(params[:id])
  end

end
