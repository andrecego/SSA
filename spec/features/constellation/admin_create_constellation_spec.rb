require 'rails_helper'

def login(role)
  User.create!(email: 'a@a.com', password: '123321', role: role)
  visit new_user_session_path
  fill_in 'Email', with: 'a@a.com'
  fill_in 'Password', with: '123321'
  click_on 'Log in'
end

feature 'User dont see create path' do
  scenario 'successfully' do
    byebug
    login(0)

    visit root_path
    click_on 'Constelações'

    expect(page).to_not have_content('Nova Constelação')
    expect(page).to have_content('Restrito para administradores')
  end
end

feature 'Admin view create path' do
  scenario 'successfully' do
    login(2)
    visit root_path
    click_on 'Constelações'
    click_on 'Cadastar nova constelação'

    expect(page).to have_content('Nova Constelação')
  end
end

feature 'Admin create a constellation' do
  scenario 'successfully' do
    login(2)
    visit root_path
    click_on 'Constelações'
    click_on 'Cadastar nova constelação'
    fill_in 'Nome', with: 'Andrômeda'
    click_on 'Cadastrar'

    expect(page).to have_content('Andrômeda')
  end

  scenario 'and fill in less than the minimum' do
    login(2)
    visit new_constellation_path
    fill_in 'Nome', with: 'An'
    click_on 'Cadastrar'

    expect(page).to have_content('Name is too short (minimum is 3 characters)')
  end

  scenario 'and didnt fill in the name' do
    login(2)
    visit new_constellation_path
    click_on 'Cadastrar'
  
    expect(page).to have_content('Name can\'t be blank')  
  end
end