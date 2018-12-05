require 'rails_helper'

describe 'homepage' do
  it 'shows a heading' do
    visit '/'
    expect(page).to have_content('Book Club')
  end

  it 'has link to HOME page' do
    visit '/'
    expect(page).to have_link("HOME")
    click_link "HOME"
    expect(page).to have_content('Book Club')
  end

  it 'has link to BOOKS page' do
    visit '/'
    expect(page).to have_link("BOOKS")
    click_link "BOOKS"
    expect(page).to have_content("Books Page")
  end

end
