require 'rails_helper'

feature 'Admin register new cosmos types' do
  scenario 'successfully' do
    visit root_path
    click_on 'Tipos de Cosmos'
    click_on 'Registrar novo cosmo'
    fill_in "Tipo de cosmo",	with: "Pedra" 
    click_on 'Enviar'
    
    expect(page).to have_content('Pedra') 
  end
end