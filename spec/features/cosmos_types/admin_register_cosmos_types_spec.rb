# frozen_string_literal: true

require 'rails_helper'

feature 'Admin register new cosmos types' do
  scenario 'successfully' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Tipos de Cosmos'
    click_on 'Registrar novo tipo de cosmo'
    fill_in 'Tipo de cosmo', with: 'Pedra'
    click_on 'Enviar'

    expect(page).to have_content('Pedra')
  end
end
