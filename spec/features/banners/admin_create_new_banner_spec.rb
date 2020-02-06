require 'rails_helper'

feature 'Admin register new banner' do
  scenario 'sucessfully' do
    rank = create(:rank, name: 'S')
    create(:character, name: 'Afrodite', rank: rank)
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Banners'
    click_on 'Cadastrar novo banner'
    select 'Afrodite', from: 'Personagem'
    fill_in 'Data de Início', with: 1.day.from_now
    fill_in 'Data Final', with: 7.days.from_now
    attach_file('Imagem', Rails.root.join('spec', 'support',
                                          'assets', 'image.png'))
    click_on 'Enviar'

    expect(page).to have_link('Afrodite')
    expect(page).to have_content("Data de Início: #{1.day.from_now.strftime("%d-%m-%y - %H:%M")}")
    expect(page).to have_content("Data Final: #{7.days.from_now.strftime("%d-%m-%y - %H:%M")}")
    expect(page).to have_css("img[src*='image.png']")
  end

  scenario 'with multiple characters' do
    rank = create(:rank, name: 'S')
    peixes = create(:constellation, name: 'Peixes')
    borracha = create(:constellation, name: 'Borracha')
    armadura_divina = create(:constellation, name: 'Armadura Divina')
    create(:character, name: 'Afrodite', rank: rank, constellation: peixes)
    create(:character, name: 'Luffy', rank: rank, constellation: borracha)
    create(:character, name: 'Seiya', rank: rank, constellation: armadura_divina)
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    visit root_path
    click_on 'Banners'
    click_on 'Cadastrar novo banner'
    select 'Afrodite', from: 'Personagem(s)'
    select 'Seiya', from: 'Personagem(s)'
    fill_in 'Data de Início', with: 1.day.from_now
    fill_in 'Data Final', with: 7.days.from_now
    attach_file('Imagem', Rails.root.join('spec', 'support',
                                          'assets', 'image.png'))
    click_on 'Enviar'

    expect(page).to have_link('Afrodite')
    expect(page).to have_link('Seiya')
    expect(page).to_not have_link('Luffy')
    expect(page).to have_content("Data de Início: #{1.day.from_now.strftime("%d-%m-%y - %H:%M")}")
    expect(page).to have_content("Data Final: #{7.days.from_now.strftime("%d-%m-%y - %H:%M")}")
    expect(page).to have_css("img[src*='image.png']")
  end
end