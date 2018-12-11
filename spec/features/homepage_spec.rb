require 'rails_helper'

describe 'homepage' do
  it 'shows a heading' do
    visit '/'
    expect(page).to have_content('Book Club')
  end

  it 'has appropriate links' do
    visit '/'
    expect(page).to have_link("HOME")
    click_link "HOME"
    expect(current_path).to eq(root_path)
    click_link "BOOKS"
    expect(current_path).to eq(books_path)
  end

end
