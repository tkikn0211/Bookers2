class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
      flash[:notice] = 'You have created book successfully.'
    else
      render :new
    end
  end

  def index
    @books = Book.all
    @user_id = current_user.id
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def edit
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      redirect_to book_path
       flash[:notice] = 'You have upda book successfully.'
    else
      render :edit
    end
  end
  
end

private

def book_params
    params.require(:book).permit(:title, :body)
end
