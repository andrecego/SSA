require 'rails_helper'

feature 'Admin register cosmo basic' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cosmos'
    click_on 'Cosmos Base'
    click_on 'Registrar nova base de cosmo'
    fill_in "Cosmo Base",	with: "PATK" 
    click_on 'Enviar'

    expect(page).to have_content('PATK') 
  end
end