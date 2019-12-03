require 'rails_helper'

feature 'Admin edit cosmo basic' do
  scenario 'successfully' do
    CosmoBasic.create!(name: 'Ataque por cento')

    visit root_path
    click_on 'Cosmos'
    click_on 'Cosmos Base'
    click_on 'Editar'
    fill_in "Cosmo Base",	with: "%DEF" 
    click_on 'Enviar'

    expect(page).to have_content('%DEF') 
    expect(page).to_not have_content('Ataque por cento') 
  end
end