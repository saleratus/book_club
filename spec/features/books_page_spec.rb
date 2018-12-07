require 'rails_helper'

describe 'BOOKS page' do
  it 'shows a heading' do
    visit '/books'
    expect(page).to have_content('Books Page')
  end

  it 'shows book listing' do
    book_1 = Book.create(title: 'Being and Time')
    book_2 = Book.create(title: 'Philosophical Investigations')
    book_3 = Book.create(title: 'Critique of Pure Reason')
    visit '/books'
    expect(page).to have_content('Being and Time')
    expect(page).to have_content('Philosophical Investigations')
    expect(page).to have_content('Critique of Pure Reason')
  end

  it 'links to SHOW page from each book' do
    book_1 = Book.create(title: 'Being and Time')
    book_2 = Book.create(title: 'Philosophical Investigations')
    book_3 = Book.create(title: 'Critique of Pure Reason')
    visit '/books'
    expect(page).to have_link(book_1[:title])
    expect(page).to have_link(book_2[:title])
    expect(page).to have_link(book_2[:title])
  end


end
