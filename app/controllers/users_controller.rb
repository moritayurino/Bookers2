class UsersController < ApplicationController
  protect_from_forgery
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to '/users'
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end