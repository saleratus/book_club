class BooksController < ApplicationController

  def index
    @books = Book.sort(params[:sort], params[:direction])
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews.all
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to books_path
  end

end
