require 'rails_helper'

feature 'Admin view cosmo basic' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cosmos'
    click_on 'Cosmos Base'

    expect(page).to have_content('Cosmos Básico') 
  end
end