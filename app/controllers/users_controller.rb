class UsersController < ApplicationController
  
  before_action :authenticate_user!
  
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
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end  

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "successfully updated."
      redirect_to user_path(@user.id)
    else
      render "edit"
    end    
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end