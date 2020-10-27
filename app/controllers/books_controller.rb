class BooksController < ApplicationController
  
  before_action :authenticate_user!
  
  
  def new
    
  end

  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
    flash[:success] = "You have created book successfully."  
    redirect_to book_path(@newbook)
    else
    @books = Book.all
    render "index"
    end
  end

  def index
    @newbook = Book.new
    @user = current_user
    @books = Book.all
  end  

  def show
    @newbook = Book.new #@bookだと変数が被ってしまうので、変数名を変えた
    @book = Book.find(params[:id])#一冊の本を特定している
    @user = @book.user #部分テンプレートに渡す本の投稿者を定義する
    @post = User.all
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end  
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = "Book was successfully deleted."
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
  
end
