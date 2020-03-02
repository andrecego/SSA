# frozen_string_literal: true

require 'rails_helper'

feature 'Visitor the 8th senses page' do
  scenario 'successfully' do
    visit root_path
    click_on '8º Sentido'

    expect(page).to have_css('h1', text: 'Rank SS')
    expect(page).to have_css('h1', text: 'Rank S')
    expect(page).to have_css('h1', text: 'Rank A')
    expect(page).to have_css('h1', text: 'Rank B')
    expect(page).to have_css("img[src*='exp_potion'][src$='.png']")
    expect(page).to have_css("img[src*='gold'][src$='.png']")
    expect(page).to have_css("img[src*='solar_dust'][src$='.png']")
    expect(page).to have_css("img[src*='star_jade'][src$='.png']")
    expect(page).to have_css("img[src*='star_pulse'][src$='.png']")
  end
end
