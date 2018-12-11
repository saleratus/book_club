class User < ApplicationRecord
  has_many :reviews

  validates_presence_of :username

  def self.three_highest_reviewers
    joins(:reviews)
    .select("users.*, count(reviews.id) as rev_count")
    .order("rev_count DESC")
    .group(:id)
    .limit(3)
  end

end
