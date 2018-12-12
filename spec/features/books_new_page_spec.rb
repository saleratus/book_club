require "rails_helper"

describe "user creates a new book" do
  describe "they link from the books index" do
    describe "they fill in the fields" do
      it "creates a new book" do
        @author_1 = Author.create(name: 'Author One')
        @author_2 = Author.create(name: 'Author Two')
        @author_3 = Author.create(name: 'Author Three')
        @book_1 = Book.create(title: 'Book the First', authors: [@author_1, @author_3], pages: 111, year: 2001)
        @book_2 = Book.create(title: 'Book the Second', authors: [@author_2], pages: 222, year: 2002)
        @book_3 = Book.create(title: 'Book the Third', authors: [@author_3, @author_2, @author_1], pages: 333, year: 2003)
        @book_4 = Book.create(title: 'Book the Fourth', authors: [@author_1], pages: 44, year: 1999)

        visit books_path
        click_link "NEW BOOK"

        expect(current_path).to eq(new_book_path)

        fill_in "book[title]", with: "New Title"
        fill_in "book[pages]",  with: 27
        fill_in "book[year]", with: 1776
        fill_in "book[authors]", with: "Author One,Issaic Asimov,Author Two"
        click_on "Create Book"

        expect(page).to have_content("New Title")
        expect(page).to have_content("27")
        expect(page).to have_content("1776")
        expect(page).to have_content("Author One")
        expect(page).to have_content("Issaic Asimov")
        expect(page).to have_content("Author Two")
      end
    end
  end
end
