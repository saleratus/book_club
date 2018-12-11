class BooksController < ApplicationController

  def index
    @books = Book.sort(params[:sort], params[:direction])
    @high_rated_books = Book.three_winners
    @low_rated_books = Book.three_losers
    @prolific_reviewers = User.three_highest_reviewers
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
  
  def new
    @book = Book.new
  end

  def create
    binding.pry
    authors_array = Author.get_authors_from_names(book_params[:authors].split(","))
    book_params[:authors] = authors_array
    book = Book.new(book_params)
    if book.save
      redirect_to "/books/#{book.id}"
    else
      redirect_to "/books/new"
    end
  end

  private

  def book_params
    #I've used standard html for authors in the form. That's why I've left authors out here.
    #Ask about this.
    params.require(:book).permit(:title, :year, :pages)
  end
end
