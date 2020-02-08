# frozen_string_literal: true

require 'rails_helper'

feature 'admin create ranks' do
  scenario 'successfully' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Ranks'
    click_on 'Registrar novo rank'
    fill_in 'Rank', with: 'lendarios'
    click_on 'Enviar'

    expect(page).to have_content('lendarios')
  end
end
