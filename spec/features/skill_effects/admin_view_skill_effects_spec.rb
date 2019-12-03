require 'rails_helper'

feature 'Admin view skill effects path' do
  scenario 'successfully' do
    visit root_path
    click_on 'Efeitos de skill'

    expect(page).to have_content('Lista dos efeitos de skills') 
  end
end