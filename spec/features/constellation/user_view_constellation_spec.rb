require 'rails_helper'

feature 'User view all constelattions' do
  scenario 'successfully' do
    Constellation.create(name: 'Andrômeda')
    Constellation.create(name: 'Pegasus')
    Constellation.create(name: 'Relógio')

    visit root_path
    click_on 'Constelações'

    expect(page).to have_content('Andrômeda')
    expect(page).to have_content('Pegasus')
    expect(page).to have_content('Relógio')
  end
end