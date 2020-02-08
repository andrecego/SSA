# frozen_string_literal: true

require 'rails_helper'

feature 'User view all constelattions' do
  scenario 'successfully' do
    Constellation.create(name: 'Andrômeda')
    Constellation.create(name: 'Pegasus')
    Constellation.create(name: 'Relógio')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Constelações'

    expect(page).to have_content('Andrômeda')
    expect(page).to have_content('Pegasus')
    expect(page).to have_content('Relógio')
  end

  scenario 'and dont have any constellations' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Constelações'

    expect(page).to have_content('Não existe nenhuma constelação registrada')
  end
end
