require 'rails_helper'

feature 'Admin create a constellation' do
  scenario 'successfully' do
    visit root_path
    click_on 'Constelações'
    click_on 'Cadastar nova constelação'
    fill_in 'Nome', with: 'Andrômeda'
    click_on 'Cadastrar'

    expect(page).to have_content('Andrômeda')
  end

  scenario 'and fill in less than the minimum' do
    visit new_constellation_path
    fill_in 'Nome', with: 'An'
    click_on 'Cadastrar'

    expect(page).to have_content('Name is too short (minimum is 3 characters)')
  end

  scenario 'and didnt fill in the name' do
    visit new_constellation_path
    click_on 'Cadastrar'
  
    expect(page).to have_content('Name can\'t be blank')  
  end
end