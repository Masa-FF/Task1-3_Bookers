class UsersController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user
  end
  
  def new
    @user = User.new 
  end  
  
  def create
    
  end
  
  def edit
    @user = User.find(params[:id]) 
  end  

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end