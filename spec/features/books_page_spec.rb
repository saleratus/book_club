require 'rails_helper'

describe 'BOOKS page' do
  before (:each) do
    @user_1 = User.create(username: "User One")
     @user_2 = User.create(username: "User Two")
     @user_3 = User.create(username: "User Three")
     @author_1 = Author.create(name: 'Author One')
     @author_2 = Author.create(name: 'Author Two')
     @author_3 = Author.create(name: 'Author Three')
     @book_1 = Book.create(title: 'Book the First', authors: [@author_1, @author_3], pages: 111, year: 2001)
     @book_2 = Book.create(title: 'Book the Second', authors: [@author_2], pages: 222, year: 2002)
     @book_3 = Book.create(title: 'Book the Third', authors: [@author_3, @author_2, @author_1], pages: 333, year: 2003)
     @book_4 = Book.create(title: 'Book the Fourth', authors: [@author_1], pages: 44, year: 1999)
     @review_1 = Review.create(rating: 1, title: "Review Title 1", body: "Lorem ipsum dolor sit amet one, consectetur adipiscing elit.", user: @user_1, book: @book_1)
     @review_2 = Review.create(rating: 3, title: "Review Title 2", body: "Lorem ipsum dolor sit amet two, consectetur adipiscing elit.", user: @user_1, book: @book_2)
     @review_3 = Review.create(rating: 2, title: "Review Title 3", body: "Lorem ipsum dolor sit amet three, consectetur adipiscing elit.", user: @user_1, book: @book_3)
     @review_4 = Review.create(rating: 1, title: "Review Title 4", body: "Lorem ipsum dolor sit amet four, consectetur adipiscing elit.", user: @user_2, book: @book_3)
     @review_5 = Review.create(rating: 2, title: "Review Title 5", body: "Lorem ipsum dolor sit amet five, consectetur adipiscing elit.", user: @user_3, book: @book_3)
     @review_6 = Review.create(rating: 3, title: "Review Title 6", body: "Lorem ipsum dolor sit amet six, consectetur adipiscing elit.", user: @user_3, book: @book_2)
    visit books_path
  end

  it 'shows book listing' do
    expect(page).to have_content('Book the First')
    expect(page).to have_content('Book the Second')
    expect(page).to have_content('Book the Third')
  end

  it 'links to SHOW page from each book' do
    expect(page).to have_link('Book the First')
    expect(page).to have_link('Book the Second')
    expect(page).to have_link('Book the Third')
  end

  it 'user_can_see_all_book_information' do
    expect(page).to have_content("Year: #{@book_1.year}")
    expect(page).to have_content("Pages: #{@book_1.pages}")
    expect(page).to have_content("#{@author_1.name}")
    expect(page).to have_content("Year: #{@book_2.year}")
    expect(page).to have_content("Pages: #{@book_2.pages}")
    expect(page).to have_content("#{@author_2.name}")
  end

end
