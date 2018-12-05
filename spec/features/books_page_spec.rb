require 'rails_helper'

describe 'BOOKS page' do
  it 'shows a heading' do
    visit '/books'
    expect(page).to have_content('Books Page')
  end

end
