require 'rails_helper'

describe 'BOOK SHOW page' do

  context 'is linked to from the book index' do

  end

  it 'user can see book information' do
    user_1 = User.create(username: "User One")
    user_2 = User.create(username: "User Two")
    user_3 = User.create(username: "User Three")
    author_1 = Author.create(name: 'Author One')
    author_2 = Author.create(name: 'Author Two')
    author_3 = Author.create(name: 'Author Three')
    book_1 = Book.create(title: 'Book the First', authors: [author_1, author_3], pages: 111, year: 2001)
    book_2 = Book.create(title: 'Book the Second', authors: [author_2], pages: 222, year: 2002)
    book_3 = Book.create(title: 'Book the Third', authors: [author_3, author_2, author_1], pages: 333, year: 2003)
    review_1 = Review.create(rating: 1, title: "Review Title 1", body: "Lorem ipsum dolor sit amet one, consectetur adipiscing elit.", user: user_1, book: book_1)
    review_2 = Review.create(rating: 2, title: "Review Title 2", body: "Lorem ipsum dolor sit amet two, consectetur adipiscing elit.", user: user_1, book: book_2)
    review_3 = Review.create(rating: 2, title: "Review Title 3", body: "Lorem ipsum dolor sit amet three, consectetur adipiscing elit.", user: user_1, book: book_3)
    review_4 = Review.create(rating: 1, title: "Review Title 4", body: "Lorem ipsum dolor sit amet four, consectetur adipiscing elit.", user: user_2, book: book_3)
    review_5 = Review.create(rating: 2, title: "Review Title 5", body: "Lorem ipsum dolor sit amet five, consectetur adipiscing elit.", user: user_3, book: book_3)


    visit book_path(book_1)

    expect(page).to have_content("#{book_1.title}")
    book_1.authors.each do |author|
      expect(page).to have_content("#{author.name}")
    end

    expect(page).to have_content("#{book_1.pages}")
    book_1.reviews.each do |review|
      expect(page).to have_content(review.title)
      expect(page).to have_content(review.user.username)
      expect(page).to have_content(review.rating)
      expect(page).to have_content(review.body)
    end
  end
end
