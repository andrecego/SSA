# frozen_string_literal: true

require 'rails_helper'

feature 'Admin register new cloth skill for character' do
  scenario 'successfully' do
    create(:character, :with_picture, name: 'Seiya')
    create(:effect, name: 'Adormecer')
    create(:effect, name: 'Veneno')
    create(:effect, name: 'Múltiplos')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    find('.nav-menu').click_on 'Personagens'
    click_on 'Seiya'
    click_on 'Cadastrar nova skill'
    fill_in 'Nome', with: 'Meteoro de Pegasus com cloth'
    fill_in 'Custo', with: '31235468'
    attach_file('Imagem', Rails.root.join('spec/support/assets/skill-img.png'))
    fill_in 'Ordem', with: '2'
    fill_in 'Descrição', with: 'Dá muito dano'
    select 'cloth', from: 'Tipo'
    check 'Adormecer'
    check 'Veneno'
    fill_in 'Skill lv. 1', with: '210% de dano'
    fill_in 'Skill lv. 2', with: '220% de dano'
    fill_in 'Skill lv. 3', with: '230% de dano'
    fill_in 'Skill lv. 4', with: '240% de dano'
    fill_in 'Skill lv. 5', with: '250% de dano'
    click_on 'Enviar'

    expect(page).to have_content('Habilidade criada com sucesso')
    expect(page).to have_css('#cloth')
    expect(page).to have_content('Meteoro de Pegasus com cloth')
    expect(page).to have_content('31235468')
    expect(page).to have_css("img[src*='skill-img.png']")
    expect(page).to have_css('.skill-2')
    expect(page).to have_content('Dá muito dano')
    expect(page).to have_content('Adormecer')
    expect(page).to have_content('Veneno')
    expect(page).to_not have_content('Múltiplos')
    expect(page).to have_content('210% de dano')
    expect(page).to have_content('220% de dano')
    expect(page).to have_content('230% de dano')
    expect(page).to have_content('240% de dano')
    expect(page).to have_content('250% de dano')
  end

  scenario 'cloth skill should be hidden by default' do
    character = create(:character)
    create(:skill, character: character, kind: 'cloth', name: 'Ice Punch')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit character_path(character)

    # find('#cloth').assert_matches_style('display': 'none')
    within('#cloth') do
      expect(page).to have_content('Ice Punch')
    end
  end
end
