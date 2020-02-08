# frozen_string_literal: true

require 'rails_helper'

feature 'Admin edit cosmo type' do
  scenario 'successfully' do
    CosmoType.create!(name: 'Esqueleto')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Tipos de Cosmos'
    click_on 'Editar'
    fill_in 'Tipo de cosmo', with: 'Caveirinha'
    click_on 'Enviar'

    expect(page).to have_content('Caveirinha')
    expect(page).to_not have_content('Esqueleto')
  end
end
