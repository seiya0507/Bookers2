class BooksController < ApplicationController
  def new
    @book = Book.new
  end


  def create
    @user = current_user
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
       redirect_to book_path(@new_book.id)
       flash[:notice] = "You have created book successfully!"
    else
       @books = Book.all
       render :index
    end
  end


  def index
    @books = Book.all
    @new_book = Book.new
    @user = current_user
  end


  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = current_user
    @book_user = @book.user
    @book_comment = BookComment.new
  end


  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
    redirect_to "/books"
    end
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id)
       flash[:notice] = "You have updated book successfully!"
    else
       render :edit
    end
  end



  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
    flash[:notice] = "You have destroyed book successfully."
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
