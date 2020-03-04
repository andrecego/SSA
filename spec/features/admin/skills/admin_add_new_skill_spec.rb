# frozen_string_literal: true

require 'rails_helper'

feature 'Admin register new skill for character' do
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
    fill_in 'Nome', with: 'Meteoro de Pegasus'
    fill_in 'Custo', with: '31235468'
    attach_file('Imagem', Rails.root.join('spec/support/assets/skill-img.png'))
    fill_in 'Descrição', with: 'Dá muito dano'
    check 'Adormecer'
    check 'Veneno'
    fill_in 'Skill lv. 1', with: '210% de dano'
    fill_in 'Skill lv. 2', with: '220% de dano'
    fill_in 'Skill lv. 3', with: '230% de dano'
    fill_in 'Skill lv. 4', with: '240% de dano'
    fill_in 'Skill lv. 5', with: '250% de dano'
    click_on 'Enviar'

    expect(page).to have_content('Habilidade criada com sucesso')
    expect(page).to have_content('Meteoro de Pegasus')
    expect(page).to have_content('31235468')
    expect(page).to have_css("img[src*='skill-img.png']")
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

  scenario 'didnt filled any field' do
    character = create(:character)
    create(:effect, name: 'Adormecer')
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit new_character_skill_path(character)
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível criar habilidade')
    expect(page).to have_content('Nome não pode ficar em branco')
  end
end
