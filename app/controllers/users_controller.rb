class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = current_user
  end
  
  def new
    @user = User.new  
  end  
  
  def edit
    @user = User.find(params[:id]) 
  end  

  def show
    @user = User.find(params[:id]) 
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)  
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end