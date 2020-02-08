# frozen_string_literal: true

require 'rails_helper'

feature 'admin view ranks' do
  scenario 'successfully' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Ranks'

    expect(page).to have_content('Registrar novo rank')
  end

  scenario 'and view list of ranks' do
    Rank.create!(name: 'S')
    Rank.create!(name: 'Lendário')
    Rank.create!(name: 'BanAna')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit ranks_path

    expect(page).to have_content('S')
    expect(page).to have_content('Lendário')
    expect(page).to have_content('BanAna')
  end
end
