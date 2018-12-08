class Book < ApplicationRecord
  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates_presence_of :title

  def average_rating
    self.reviews.average(:rating).round(2)
  end

  def review_count
    self.reviews.count
  end

end
