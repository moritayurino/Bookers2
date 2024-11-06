class BooksController < ApplicationController
  protect_from_forgery

  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def create
    
    @books = Book.all
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:success] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
