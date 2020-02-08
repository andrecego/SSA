# frozen_string_literal: true

require 'rails_helper'

feature 'Admin edit constellation' do
  scenario 'successfully' do
    Constellation.create!(name: 'Andrômeda')
    Constellation.create!(name: 'Pegasus')
    Constellation.create!(name: 'Sagitário')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Constelações'
    find('.list:nth-child(2) li').click_on 'Editar'
    fill_in 'Nome', with: 'Touro'
    click_on 'Cadastrar'

    expect(page).to_not have_content('Pegasus')
    expect(page).to have_content('Touro')
  end

  scenario 'and failed' do
    Constellation.create!(name: 'Andrômeda')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit constellations_path
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content('Name can\'t be blank')
  end
end
