class BooksController < ApplicationController
  
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @book = Book.new
  end

  def show
    @newbook = Book.new #@bookだと変数が被ってしまうので、変数名を変えた
    @book = Book.find(params[:id])#一冊の本を特定している
    @user = @book.user #部分テンプレートに渡す本の投稿者を定義する
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end  
  
  
end
