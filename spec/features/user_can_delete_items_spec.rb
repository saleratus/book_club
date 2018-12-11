require 'rails_helper'

describe 'delete book review' do
  it "can delete book review" do
    @book_1 = Book.create(title: "Book the First", pages: 111, year: 2001)
    @user_3 = User.create(username: "User Three")
    @review_4 = @user_3.reviews.create(title: "Review Title 4", body: "Lorem ipsum dolor sit amet one, consectetur adipiscing elit.", rating: 1, book: @book_1)

    visit user_path(@user_3)

    expect(page).to have_content(@review_4.title)

    click_link 'Delete Review'

    expect(current_path).to eq(user_path(@user_3))

    expect(page).to_not have_content(@review_4.title)
  end
end

describe 'delete book' do
  it 'can delete a book' do
    @book_1 = Book.create(title: "Book the First", pages: 111, year: 2001)
    @book_2 = Book.create(title: "Book the Second", pages: 222, year: 2002)
    @book_3 = Book.create(title: "Book the Third", pages: 333, year: 2003)

    visit books_path

    expect(page).to have_content(@book_1.title)
    expect(page).to have_content(@book_2.title)
    expect(page).to have_content(@book_3.title)

    visit book_path(@book_1)

    click_link 'Delete Book'

    expect(current_path).to eq(books_path)
    expect(page).to_not have_content(@book_1.title)
  end
end
