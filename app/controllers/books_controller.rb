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

  def new
    @book = Book.new
  end

  def create
    book = Book.create(book_params)
    if book.save
      redirect_to "/books/#{book.id}"
    else
      redirect_to "/books/new"
    end
  end

  private

  def book_params
    param_set = params.require(:book).permit(:title, :year, :pages, :authors)
    author_names = param_set[:authors].split(",")
    param_set[:authors] = author_names.map do |name|
      Author.find_or_create_by(name: name)
    end
    param_set[:title] = param_set[:title].titleize
    param_set
  end

end
