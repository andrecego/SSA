require 'rails_helper'

feature 'admin create ranks' do
  scenario 'successfully' do
    visit root_path
    click_on 'Ranks'
    click_on 'Registrar novo rank'
    fill_in "Rank",	with: "lendarios" 
    click_on 'Enviar'

    expect(page).to have_content('lendarios') 
  end
end