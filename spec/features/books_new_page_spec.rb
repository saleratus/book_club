require "rails_helper"

describe "user creates a new book" do
  describe "they link from the books index" do
    describe "they fill in the fields" do
      it "creates a new book" do
        visit books_path
        click_link "NEW BOOK"

        expect(current_path).to eq(new_book_path)

        fill_in "book[title]", with: "New Title"
        fill_in "book[pages]",  with: 27
        fill_in "book[year]", with: 1776
        fill_in "book[authors]", with: "Issaic Asimov"
        click_on "Create Book"

        expect(page).to have_content("New Title")
        expect(page).to have_content("27")
        expect(page).to have_content("1776")
        expect(page).to have_content("Issaic Asimov")
      end
    end
  end
end
