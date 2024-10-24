class BooksController < ApplicationController
  protect_from_forgery
  def new
    @book = Book.new
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body,)
  end
end
