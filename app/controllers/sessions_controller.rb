class SessionsController < ApplicationController

  before_action :redirect_logged_in_users, only: [:new, :create]

  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id 
      flash[:success] = "Logged in!"
      redirect_to root_path
    else
      flash.now[:error] = "Sorry, please try again. Details incorrect."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out!"
    redirect_to login_path
  end

  private 

  def redirect_logged_in_users
    if logged_in?
      flash[:error] = "You are already logged in!"
      redirect_to root_path
    end
  end

end