# frozen_string_literal: true

require 'rails_helper'

feature 'Admin create a new cosmos' do
  scenario 'successfully' do
    create(:cosmo_type, name: 'Lunar')
    create(:cosmo_type, name: 'Solar')
    create(:cosmo_basic, name: 'Ataque Cósmico')
    create(:cosmo_basic, name: 'Dano Cósmico %')
    create(:cosmo_basic, name: 'Defesa Cósmica %')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Cosmos'
    click_on 'Registrar novo cosmo'
    fill_in 'Nome', with: 'Eagle Eye'
    select 'Solar', from: 'Tipo do Cosmo'
    fill_in 'Efeito de set', with: '10% HP'
    check 'Ataque Cósmico'
    check 'Dano Cósmico %'
    attach_file('Foto', 'spec/support/assets/test-image.png')
    click_on 'Enviar'

    expect(page).to have_content('Cosmo criado com sucesso')
    expect(page).to have_css('h1', text: 'Eagle Eye')
    expect(page).to have_content('Tipo: Solar')
    expect(page).to have_content('Ataque Cósmico')
    expect(page).to have_content('Dano Cósmico %')
    expect(page).to have_css("img[src*='test-image.png']")
  end

  scenario 'but didnt provide a photo' do
    create(:cosmo_type, name: 'Lunar')
    create(:cosmo_type, name: 'Solar')
    create(:cosmo_basic, name: 'Ataque Cósmico')
    create(:cosmo_basic, name: 'Dano Cósmico %')
    create(:cosmo_basic, name: 'Defesa Cósmica %')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Admin'
    click_on 'Cosmos'
    click_on 'Registrar novo cosmo'
    fill_in 'Nome', with: 'Eagle Eye'
    select 'Solar', from: 'Tipo do Cosmo'
    fill_in 'Efeito de set', with: '10% HP'
    check 'Ataque Cósmico'
    check 'Dano Cósmico %'
    click_on 'Enviar'

    expect(page).to have_content('Cosmo criado com sucesso')
    expect(page).to have_css('h1', text: 'Eagle Eye')
    expect(page).to have_content('Tipo: Solar')
    expect(page).to have_content('Ataque Cósmico')
    expect(page).to have_content('Dano Cósmico %')
    expect(page).to have_css("img[src*='cosmo-placeholder'][src$='.png']")
  end
end
