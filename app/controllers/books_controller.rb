class BooksController < ApplicationController

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to root_path
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @chose_book = Book.find(params[:id])
    @user = User.find_by(id: @chose_book.user_id)
    @book = Book.new
  end

  def edit
  end

  def update
  end


  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
