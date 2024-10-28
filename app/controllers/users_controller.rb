class UsersController < ApplicationController
  protect_from_forgery
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
  
  end

  def edit
    @user = @current_user
  end

  def create
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end