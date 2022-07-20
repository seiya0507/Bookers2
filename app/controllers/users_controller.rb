class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
