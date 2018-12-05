require 'rails_helper'

describe 'AUTHOR SHOW page' do
  it 'shows a heading' do
    visit '/authors/3'
    expect(page).to have_content('Single Author')
  end

end
