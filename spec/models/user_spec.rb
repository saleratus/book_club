require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:username)}
  end

  describe "relationshps" do
    it {should have_many(:reviews)}
    it {should have_many(:books).through(:reviews)}
  end

  describe "instance method" do
    it "destroys review" do
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
      @review_1 = @user_1.reviews.create(rating: 1, title: "Review Title 1", body: "Lorem ipsum dolor sit amet one, consectetur adipiscing elit.", user: @user_1, book: @book_1)
      @review_2 = @user_2.reviews.create(rating: 3, title: "Review Title 2", body: "Lorem ipsum dolor sit amet two, consectetur adipiscing elit.", user: @user_1, book: @book_2)

      @review_1.destroy
      expect(@book_1.review_count).to eq(0)
    end
  end
end
