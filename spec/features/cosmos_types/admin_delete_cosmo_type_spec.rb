# frozen_string_literal: true

require 'rails_helper'

feature 'Admin delete cosmo type' do
  scenario 'successfully' do
    CosmoType.create!(name: 'Errei o nome')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Tipos de Cosmos'
    click_on 'Deletar'

    expect(page).to_not have_content('Errei o nome')
  end
end
