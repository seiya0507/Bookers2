class BooksController < ApplicationController
  def new
    @book = Book.new
  end


  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.id)
       flash[:notice] = "Book was successfully created."
    else
       @books = Book.all
       render :index
    end
  end


  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end


  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = current_user
  end


  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
    redirect_to book_path(@book.id)
    end
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id)
       flash[:notice] = "Book was successfully updated."
    else
       render :edit
    end
  end



  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
    flash[:notice] = "Book was successfully destroyed."
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
