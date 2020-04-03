# frozen_string_literal: true

require 'rails_helper'

feature 'Guest search for a character' do
  context 'by rank', js: true do
    scenario 'successfully' do
      rank_s = create(:rank, name: 'S')
      rank_b = create(:rank, name: 'B')
      create(:character, :with_picture, name: 'Afrodite', rank: rank_s)
      create(:character, :with_picture, name: 'Seiya', rank: rank_b)

      visit root_path
      within 'nav' do
        click_on 'Personagens'
      end
      select 'S', from: 'rank_id'
      sleep(1)

      expect(page).to have_css("img[title='Afrodite']")
      expect(page).to_not have_css("img[title='Seiya']")
    end

    scenario 'rank without character' do
      rank_s = create(:rank, name: 'S')
      rank_b = create(:rank, name: 'B')
      create(:rank, name: 'SS')
      create(:character, :with_picture, name: 'Afrodite', rank: rank_s)
      create(:character, :with_picture, name: 'Seiya', rank: rank_b)

      visit root_path
      within 'nav' do
        click_on 'Personagens'
      end
      select 'SS', from: 'rank_id'
      sleep(1)

      expect(page).to_not have_css("img[title='Afrodite']")
      expect(page).to_not have_css("img[title='Seiya']")
    end
  end

  context 'by name', js: true do
    scenario 'successfully' do
      rank_s = create(:rank, name: 'S')
      create(:character, :with_picture, name: 'Afrodite', rank: rank_s)
      create(:character, :with_picture, name: 'Seiya', rank: rank_s)

      visit root_path
      within 'nav' do
        click_on 'Personagens'
      end
      fill_in 'q', with: 'Afrodite'
      sleep(1)

      expect(page).to have_css("img[title='Afrodite']")
      expect(page).to_not have_css("img[title='Seiya']")
    end

    scenario 'only filled in 2 letters' do
      rank_s = create(:rank, name: 'S')
      create(:character, :with_picture, name: 'Afrodite', rank: rank_s)
      create(:character, :with_picture, name: 'Seiya', rank: rank_s)

      visit root_path
      within 'nav' do
        click_on 'Personagens'
      end
      fill_in 'q', with: 'Af'
      find('#q').native.send_keys(:return)
      sleep(1)

      expect(page).to have_css("img[title='Afrodite']")
      expect(page).to_not have_css("img[title='Seiya']")
    end

    scenario 'dont have any character' do
      rank_s = create(:rank, name: 'S')
      create(:character, :with_picture, name: 'Afrodite', rank: rank_s)
      create(:character, :with_picture, name: 'Seiya', rank: rank_s)

      visit root_path
      within 'nav' do
        click_on 'Personagens'
      end
      fill_in 'q', with: 'Pikachu'
      sleep(1)

      expect(page).to_not have_css("img[title='Afrodite']")
      expect(page).to_not have_css("img[title='Seiya']")
    end
  end
end
