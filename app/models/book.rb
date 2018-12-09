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
    title_sort #Default sort if sort_type = nil
  end

  def self.title_sort
    order(:title)
  end
  def self.page_count_sort(direction = :asc)
    order(pages: direction)
  end
  def self.review_count_sort(direction = :asc)
    order('rev_count ASC')
  end
  def self.avg_rating_sort(direction = :asc)
    order('avg_rating ASC')
  end

  #def self.sort_prep
    #select('books.*, coalesce(AVG(rating),0) AS avg_rating, COUNT(reviews) AS rev_count')
    #.left_outer_joins(:reviews)
    #.group(:id)
  #end

  ### STATS ###

  def average_rating
    return "Not rated" if reviews.count == 0
    reviews.average(:rating).round(1).to_s
  end
  def review_count
    reviews.count
  end
  def self.three_winners
    #winners = order(avg_rating: :desc).limit(3)
    #winners.reorder(avg_rating: :asc)
  end
  def self.three_losers
    #winners = order(avg_rating: :asc).limit(3)
    #winners.reorder(avg_rating: :desc)
  end

end
