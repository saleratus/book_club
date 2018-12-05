require 'rails_helper'

describe 'BOOK SHOW page' do
  it 'shows a heading' do
    visit '/books/1'
    expect(page).to have_content('Single Book')
  end

end
