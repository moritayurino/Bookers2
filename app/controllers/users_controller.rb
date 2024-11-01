class UsersController < ApplicationController
  protect_from_forgery
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @user = current_user
    @book.user_id = current_user.id
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path(@user.id)
    end
  end
  
  def login
    user = User.find(params[:name])
    if user && user.authenticate(params[:password])
      flash[:success_login] = "ログインに成功しました"
      redirect_to user_path(@user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:success_update] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :password, :password_confirmation)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end