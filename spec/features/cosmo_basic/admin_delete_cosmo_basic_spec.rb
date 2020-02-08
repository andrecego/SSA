# frozen_string_literal: true

require 'rails_helper'

feature 'Admin delete cosmo basic' do
  scenario 'successfully' do
    CosmoBasic.create!(name: 'Errei o status')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Cosmos Base'
    click_on 'Deletar'

    expect(current_path).to eq(cosmo_basics_path)
    expect(page).to_not have_content('Errei o status')
  end
end
