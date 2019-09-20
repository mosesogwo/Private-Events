class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.created_events.where("date > ?", Date.today)
    @past_events = @user.created_events.where("date <= ?", Date.today)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # redirect_to 
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end


