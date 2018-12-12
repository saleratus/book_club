class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :rating, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1, only_integer: true}
  validates_presence_of :title, :body, :rating

  def self.newest
    Review.order("created_at DESC")
  end

  def self.oldest
    Review.order("created_at ASC")
  end
end
