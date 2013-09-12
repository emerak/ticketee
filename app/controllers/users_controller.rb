class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      Notifier.user_created(@user).deliver
      flash[:notice] = "user has been created."
    else
      flash[:error]  = "User has not been created."
      redirect_to :back
    end
  
  end

  def show
  end

  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
end
