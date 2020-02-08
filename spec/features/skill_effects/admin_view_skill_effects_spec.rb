# frozen_string_literal: true

require 'rails_helper'

feature 'Admin view skill effects path' do
  scenario 'successfully' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Efeitos de skill'

    expect(page).to have_content('Lista dos efeitos de skills')
  end
end
