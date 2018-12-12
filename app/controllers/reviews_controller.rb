class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    review = Review.create(review_params)
    if book.save
      redirect_to "/books/#{book.id}"
    else
      redirect_to "/books/new"
    end
  end

  def destroy
    review = Review.find(params[:id])
    @user = review.user
    review.destroy
    redirect_to user_path(@user.id)
  end

  private

  def review_params
    param_set = params.require(:review).permit(:rating, :title, :body, :username)
    param_set[:book] = @book
    param_set[:user] = User.find_by(username: param_set[:username])
    param_set
  end


end
