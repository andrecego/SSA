# frozen_string_literal: true

require 'rails_helper'

feature 'Admin edit cosmo basic' do
  scenario 'successfully' do
    CosmoBasic.create!(name: 'Ataque por cento')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Cosmos Base'
    click_on 'Editar'
    fill_in 'Cosmo Base', with: '%DEF'
    click_on 'Enviar'

    expect(page).to have_content('%DEF')
    expect(page).to_not have_content('Ataque por cento')
  end
end
