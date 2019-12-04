require 'rails_helper'

feature 'Admin view cosmos' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cosmos'

    expect(page).to have_content('Todos Cosmos') 
  end
end