# frozen_string_literal: true

require 'rails_helper'

describe 'API sends summon markers' do
  it 'successfully' do
    pegasus = create(:constellation, :with_picture,
                     name: 'Pegasus', latitude: 0.2, longitude: 0.8)
    seiya = create(:character, constellation: pegasus, name: 'Seiya')

    get '/api/v1/summon/markers'

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status :ok
    expect(json[0][:id]).to eq pegasus.id
    expect(json[0][:image]).to match(/.png$/)
    expect(json[0][:tooltip]).to eq 'Constelação de Pegasus'
    expect(json[0][:width]).to eq 256
    expect(json[0][:height]).to eq 256
    expect(json[0][:latitude]).to eq '0.2'
    expect(json[0][:longitude]).to eq '0.8'
    expect(json[0][:content]).to include('<h1>Personagens</h1><hr>')
    expect(json[0][:content]).to match(
      %r{<li>(.*)/characters/#{seiya.id}(.*)Seiya(.*)</li>}
    )
  end
end
