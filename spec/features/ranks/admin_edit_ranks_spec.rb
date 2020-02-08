# frozen_string_literal: true

require 'rails_helper'

feature 'Admin edit rank' do
  scenario 'successfully' do
    Rank.create!(name: 'batata')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Ranks'
    click_on 'Editar'
    fill_in 'Rank', with: 'Lendário'
    click_on 'Enviar'

    expect(page).to have_content('Lendário')
    expect(page).to_not have_content('batata')
  end
end
