require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "relationshps" do
    it {should have_many(:reviews)}
    it {should have_many(:book_authors)}
    it {should have_many(:authors).through(:book_authors)}
  end

  describe "validations" do
    it {should validate_presence_of(:title)}
  end

  describe 'model methods' do
    before (:each) do
      @user_1 = User.create(username: "User One")
      @user_2 = User.create(username: "User Two")
      @user_3 = User.create(username: "User Three")
      @user_4 = User.create(username: "User Four")
      @author_1 = Author.create(name: 'Author One')
      @author_2 = Author.create(name: 'Author Two')
      @author_3 = Author.create(name: 'Author Three')
      @book_1 = Book.create(title: 'Book the First', authors: [@author_1, @author_3], pages: 111, year: 2001)
      @book_2 = Book.create(title: 'Book the Second', authors: [@author_2], pages: 222, year: 2002)
      @book_3 = Book.create(title: 'Book the Third', authors: [@author_3, @author_2, @author_1], pages: 333, year: 2003)
      @book_4 = Book.create(title: 'Book the Fourth', authors: [@author_1], pages: 44, year: 1999)
      @review_1 = Review.create(rating: 1, title: "Review Title 1", body: "Lorem ipsum dolor sit amet one, consectetur adipiscing elit.", user: @user_1, book: @book_1)
      @review_2 = Review.create(rating: 2, title: "Review Title 2", body: "Lorem ipsum dolor sit amet two, consectetur adipiscing elit.", user: @user_1, book: @book_2)
      @review_3 = Review.create(rating: 3, title: "Review Title 3", body: "Lorem ipsum dolor sit amet three, consectetur adipiscing elit.", user: @user_2, book: @book_2)
      @review_4 = Review.create(rating: 1, title: "Review Title 4", body: "Lorem ipsum dolor sit amet four, consectetur adipiscing elit.", user: @user_1, book: @book_3)
      @review_5 = Review.create(rating: 2, title: "Review Title 5", body: "Lorem ipsum dolor sit amet five, consectetur adipiscing elit.", user: @user_2, book: @book_3)
      @review_6 = Review.create(rating: 2, title: "Review Title 6", body: "Lorem ipsum dolor sit amet six, consectetur adipiscing elit.", user: @user_3, book: @book_3)
      @review_7 = Review.create(rating: 3, title: "Review Title 7", body: "Lorem ipsum dolor sit amet seven, consectetur adipiscing elit.", user: @user_4, book: @book_3)

    end

    it 'finds average rating for a book' do
      expect(@book_1.average_rating).to eq('1.0')
      expect(@book_3.average_rating).to eq('2.0')
      expect(@book_4.average_rating).to eq('Not rated')
    end

    it 'finds total review count for a book' do
      expect(@book_1.review_count).to eq(1)
      expect(@book_3.review_count).to eq(4)
    end

    it 'sorts by title - for default view' do
      expect(Book.sort).to eq([@book_1, @book_4, @book_2, @book_3])
    end

    it 'sorts by page count - ascending' do
      expect(Book.sort('page_count')).to eq([@book_4, @book_1, @book_2, @book_3])
    end
    it 'sorts by page count - descending' do
      expect(Book.sort('page_count', 'DESC')).to eq([@book_3, @book_2, @book_1, @book_4])
    end

    xit 'sorts by review count - ascending' do
      expect(Book.sort('review_count')).to eq([@book_4, @book_1, @book_2, @book_3])
    end
    xit 'sorts by review count - descending' do
      expect(Book.sort('review_count', 'DESC')).to eq([@book_3, @book2, @book_1, @book_4])
    end

    it 'sorts by average rating - ascending' do
      expect(Book.sort('avg_rating')).to eq([@book_1, @book_3, @book_2])
    end
    it 'sorts by average rating - descending' do
      expect(Book.sort('avg_rating', 'DESC')).to eq([@book_2, @book_3, @book_1])
    end
  end

end
