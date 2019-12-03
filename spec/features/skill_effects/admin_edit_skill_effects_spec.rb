require 'rails_helper'

feature 'Admin edit skill effects' do
  scenario 'successfully' do
    Effect.create!(name: 'Ataque Básico')
    visit root_path
    click_on 'Efeitos de skill'
    click_on 'Editar'
    fill_in "Efeito",	with: "Ataque em Área" 
    click_on 'Enviar'

    expect(page).to have_content('Ataque em Área') 
    expect(page).to_not have_content('Ataque Básico') 
  end
end