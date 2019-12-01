require 'rails_helper'

feature 'Admin deleted constellation' do
  scenario 'successfully' do
    Constellation.create!(name: 'Andrômeda')
    Constellation.create!(name: 'Pegasus')
    Constellation.create!(name: 'Sagitário')

    visit root_path
    click_on 'Constelações'
    find(".list:nth-child(2) li").click_on  'Deletar'
    
    expect(page).to_not have_content('Pegasus')
  end

  scenario 'and failed' do
    visit constellations_path

    expect(page).to_not have_content('Deletar')
  end
end