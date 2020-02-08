# frozen_string_literal: true

require 'rails_helper'

feature 'Admin register skill effects' do
  scenario 'successfully' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Efeitos de skill'
    click_on 'Registrar novo efeito'
    fill_in 'Efeito', with: 'Passivo'
    click_on 'Enviar'

    expect(page).to have_content('Passivo')
  end
end
