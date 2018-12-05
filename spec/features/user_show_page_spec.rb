require 'rails_helper'

describe 'USER SHOW page' do
  it 'shows a heading' do
    visit '/users/1'
    expect(page).to have_content('Single User')
  end

end
