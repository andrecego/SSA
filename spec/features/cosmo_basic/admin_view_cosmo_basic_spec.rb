# frozen_string_literal: true

require 'rails_helper'

feature 'Admin view cosmo basic' do
  scenario 'successfully' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Cosmos Base'

    expect(page).to have_content('Cosmos Básico')
  end
end
