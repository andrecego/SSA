require 'rails_helper'

feature 'Admin delete cosmo basic' do
  scenario 'successfully' do
    CosmoBasic.create!(name: 'Errei o status')

    visit root_path
    click_on 'Cosmos'
    click_on 'Cosmos Base'
    click_on 'Deletar'

    expect(page).to_not have_content('Errei o status') 
  end
end