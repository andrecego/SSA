# frozen_string_literal: true

require 'rails_helper'

feature 'Admin view cosmos types' do
  scenario 'successfully' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Tipos de Cosmos'

    expect(page).to have_content('Tipos de cosmo')
  end
end
