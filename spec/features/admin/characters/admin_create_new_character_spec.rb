# frozen_string_literal: true

require 'rails_helper'

feature 'Admin create new character' do
  scenario 'successfully' do
    create(:rank, name: 'SS')
    create(:rank, name: 'S')
    create(:constellation, name: 'Cardume')
    create(:constellation, name: 'Peixes')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    find('.nav-menu').click_on 'Personagens'
    click_on 'Cadastrar novo personagem'
    fill_in 'Nome', with: 'Afrodite'
    select 'S', from: 'Rank'
    select 'Peixes', from: 'Constelação'
    attach_file('Foto', 'spec/support/assets/character-image.png')
    click_on 'Enviar'

    expect(page).to have_content('Afrodite')
    expect(page).to have_content('Peixes')
    expect(page).to have_css("img[src*='character-image.png']")
  end

  scenario 'but didnt fill in the name' do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit new_character_path
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível cadastrar o personagem')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Rank não pode ficar em branco')
    expect(page).to have_content('Constelação não pode ficar em branco')
  end
end
