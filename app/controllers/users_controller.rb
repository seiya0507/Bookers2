class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @new_book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
       flash[:notice] = "You have updated user successfully!"
    else
       render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
