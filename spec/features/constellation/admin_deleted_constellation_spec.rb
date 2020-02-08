# frozen_string_literal: true

require 'rails_helper'

feature 'Admin deleted constellation' do
  scenario 'successfully' do
    Constellation.create!(name: 'Andrômeda')
    Constellation.create!(name: 'Pegasus')
    Constellation.create!(name: 'Sagitário')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Constelações'
    find('.list:nth-child(2) li').click_on 'Deletar'

    expect(page).to_not have_content('Pegasus')
  end

  scenario 'and didnt have any constellation' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit constellations_path

    expect(page).to_not have_content('Deletar')
  end
end
