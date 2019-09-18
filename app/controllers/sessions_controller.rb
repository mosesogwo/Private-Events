class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      remember @user
      redirect_to user_path @user
    else 
      render 'new'
    end
  end
end
