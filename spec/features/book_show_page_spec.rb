require 'rails_helper'

describe 'BOOK SHOW page' do

  context 'is linked to from the book index' do

    it 'shows a heading' do
      book = Book.create(title: 'Being and Time')
      visit books_path
      click_link book.title
      expect(page).to have_content('Single Book')
    end
    it "displays information for one article" do
      book = Book.create(title: 'Being and Time')
      visit book_path(book)
      expect(page).to have_content(book.title)
    end

  end
  it 'user can see book information' do
    book_1 = Book.create(title: "Book the First", pages: 111, year: 2001,)
    book_1.authors.create(name: "Author One"
    book_1.authors.create(name: "Author two")
    user_1 = User.create(name: "User One")
    user_2 = User.create(name: "User Two")
    user_3 = User.create(name: "User Three")
    user_1.reviews.create(title: "Review Title 1", description: "Lorem ipsum dolor sit amet one, consectetur adipiscing elit.", rating: 4, book: book_1)
    user_2.reviews.create(title: "Review Title 2", description: "Lorem ipsum dolor sit amet one, consectetur adipiscing elit.", rating: 5, book: book_1)
    user_3.reviews.create(title: "Review Title 3", description: "Lorem ipsum dolor sit amet one, consectetur adipiscing elit.", rating: 3, book: book_1)


    visit book_path(book_1)

    expect(page).to have_content("#{book_1.title}")
    book_1.authors.each do |author|
      expect(page).to have_content("#{author.name}")
    end

    expect(page).to have_content("#{book_1.pages}")
    book_1.reviews.each do |review|
      expect(page).to have_content(review.title)
      expect(page).to have_content(review.user.name)
      expect(page).to have_content(review.rating)
      expect(page).to have_content(review.description)
    end
  end
