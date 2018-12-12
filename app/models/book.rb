class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  has_many :users, through: :reviews

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

  def sort_reviews(direction)
    reviews.order("rating #{direction}")
  end

  def self.sort_reviews_number(direction)
    Book.arrange("reviews_count", "#{direction}")
  end

  def self.num_pages_sort(direction)
    Book.order("pages #{direction}")
  end

  def top_3_reviews
    sort_reviews('DESC').first(3)
  end

  def bottom_3_reviews
    sort_reviews('ASC').first(3)
  end

  def self.highest_rated_3
    Book.arrange('avg_rating', 'DESC').first(3)
  end

  def self.lowest_rated_3
    Book.arrange('avg_rating', 'ASC').first(3)
  end
  
  def self.three_winners
    self.avg_rating_sort('DESC').limit(3)
  end
  def self.three_losers
    self.avg_rating_sort('ASC').limit(3)
  end

  def many_authors(id)
   authors.where.not(id: id)
 end
end
