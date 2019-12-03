require 'rails_helper'

feature 'Admin view cosmos types' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cosmos'
    click_on 'Tipos de Cosmos'

    expect(page).to have_content('Tipos de cosmo') 
  end
end