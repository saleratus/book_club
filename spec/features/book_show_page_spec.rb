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

end
