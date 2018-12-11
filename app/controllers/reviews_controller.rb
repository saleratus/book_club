class ReviewsController < ApplicationController

  def destroy
    review = Review.find(params[:id])
    @user = review.user
    review.destroy
    redirect_to user_path(@user.id)
  end
end
