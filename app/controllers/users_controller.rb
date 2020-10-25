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

  end
  
end