require 'rails_helper'

feature 'Admin delete rank' do
  scenario 'successfully' do
    Rank.create!(name: 'Errei o nome')

    visit root_path
    click_on 'Ranks'
    click_on 'Deletar'

    expect(page).to_not have_content('Errei o nome') 
  end
end