class Book < ApplicationRecord
  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates_presence_of :title, :pages, :year

  ### SORTS ###

  def self.sort(sort_type = nil, direction = nil)
    direction = 'ASC' unless direction == 'DESC' #ASC is default
    return page_count_sort(direction)   if sort_type == 'page_count'
    return review_count_sort(direction) if sort_type == 'review_count'
    return avg_rating_sort(direction)   if sort_type == 'avg_rating'
    title_sort #Default sort if no arguements
  end

  def self.title_sort
    order(:title)
  end
  def self.page_count_sort(direction = 'ASC')
    order(pages: direction)
  end
  def self.review_count_sort(direction = 'ASC')
    left_outer_joins(:reviews)
    .select("books.*, coalesce(count(reviews.id),0) as rev_count")
    .order("rev_count #{direction}")
    .group(:id)
  end
  def self.avg_rating_sort(direction = 'ASC')
    joins(:reviews)
    .select("books.*, avg(reviews.rating) as avg_review")
    .order("avg_review #{direction}")
    .group(:id)
  end

  ### STATS ###

  def average_rating
    return "Not rated" if reviews.count == 0
    reviews.average(:rating).round(1).to_s
  end
  def review_count
    reviews.count
  end
  def self.three_winners
    self.avg_rating_sort('DESC').limit(3)
  end
  def self.three_losers
    self.avg_rating_sort('ASC').limit(3)
  end

end
