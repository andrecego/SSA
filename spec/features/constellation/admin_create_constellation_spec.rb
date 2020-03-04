# frozen_string_literal: true

require 'rails_helper'

feature 'User dont see create path' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user, scope: :user)

    visit constellations_path

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content('Nova Constelação')
  end
end

feature 'Admin view create path' do
  scenario 'successfully' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Constelações'
    click_on 'Cadastar nova constelação'

    expect(page).to have_content('Nova Constelação')
  end
end

feature 'Admin create a constellation' do
  scenario 'successfully' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Constelações'
    click_on 'Cadastar nova constelação'
    fill_in 'Nome', with: 'Andrômeda'
    click_on 'Cadastrar'

    expect(page).to have_content('Andrômeda')
  end

  scenario 'and fill in less than the minimum' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit new_constellation_path
    fill_in 'Nome', with: 'A'
    click_on 'Cadastrar'

    expect(page).to have_content('Nome é muito curto (mínimo: 2 caracteres)')
  end

  scenario 'and didnt fill in the name' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit new_constellation_path
    click_on 'Cadastrar'

    expect(page).to have_content('Nome não pode ficar em branco')
  end
end
