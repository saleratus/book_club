class BooksController < ApplicationController

  def index
    @books = Book.sort(params[:sort], params[:direction])
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews.all
  end

end
