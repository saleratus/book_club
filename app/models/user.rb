class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :books, through: :reviews

  validates_presence_of :username

  def self.three_highest_reviewers
    joins(:reviews)
    .select("users.*, count(reviews.id) as rev_count")
    .order("rev_count DESC")
    .group(:id)
    .limit(3)
  end

  def sorted_reviews(params)

    if params[:sort] == 'newest'
      reviews.order(created_at: :desc)
    elsif params[:sort] == 'oldest'
      reviews.order(created_at: :asc)
    else
      reviews
    end
  end
end
