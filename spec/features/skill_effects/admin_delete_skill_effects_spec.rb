require 'rails_helper'

feature 'Admin delete skill effect' do
  scenario 'successfully' do
    Effect.create!(name: 'Efeito errado')

    visit root_path
    click_on 'Efeitos de skill'
    click_on 'Deletar'

    expect(page).to_not have_content('Efeito errado') 
  end
end