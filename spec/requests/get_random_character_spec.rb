# frozen_string_literal: true

require 'rails_helper'

describe 'API sends random character' do
  it 'successfully' do
    pegasus = create(:constellation, :with_picture,
                     name: 'Pegasus', latitude: 0.2, longitude: 0.8)
    rank = create(:rank, name: 'S')
    seiya = create(:character, :with_picture, constellation: pegasus,
                                              name: 'Seiya', rank: rank)

    summon = Api::V1::SummonController.new
    allow(Api::V1::SummonController).to receive(:new).and_return(summon)
    allow(summon).to receive(:random_weighted).with(anything).and_return(:s)
    get '/api/v1/summon/random'

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status :ok
    expect(json[:id]).to eq seiya.id
    expect(json[:name]).to eq 'Seiya'
    expect(json[:image]).to match(/.png$/)
    expect(json[:constellation][:latitude]).to eq '0.2'
    expect(json[:constellation][:longitude]).to eq '0.8'
  end

  it 'doesnt have a constellation with picture' do
    pegasus = create(:constellation, name: 'Pegasus',
                                     latitude: 0.2, longitude: 0.8)
    rank = create(:rank, name: 'S')
    create(:character, :with_picture, constellation: pegasus,
                                      name: 'Seiya', rank: rank)

    summon = Api::V1::SummonController.new
    allow(Api::V1::SummonController).to receive(:new).and_return(summon)
    allow(summon).to receive(:random_weighted).with(anything).and_return(:s)
    get '/api/v1/summon/random'

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status :not_found
    expect(json[:message]).to eq('Nenhuma constelação com imagem disponível')
  end

  it 'one character doesnt have photo' do
    constellation = create(:constellation, :with_picture,
                           name: 'Pegasus', latitude: 0.2, longitude: 0.8)
    rank = create(:rank, name: 'S')
    create(:character, constellation: constellation, name: 'Seiya', rank: rank)
    shun = create(:character, :with_picture, constellation: constellation,
                                             name: 'Shun', rank: rank)

    summon = Api::V1::SummonController.new
    allow(Api::V1::SummonController).to receive(:new).and_return(summon)
    allow(summon).to receive(:random_weighted).with(anything).and_return(:s)
    get '/api/v1/summon/random'

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:id]).to eq shun.id
    expect(json[:name]).to eq shun.name
  end

  it 'character doesnt have a picture' do
    pegasus = create(:constellation, :with_picture,
                     name: 'Pegasus', latitude: 0.2, longitude: 0.8)
    rank = create(:rank, name: 'S')
    create(:character, constellation: pegasus, name: 'Seiya', rank: rank)

    summon = Api::V1::SummonController.new
    allow(Api::V1::SummonController).to receive(:new).and_return(summon)
    allow(summon).to receive(:random_weighted).with(anything).and_return(:s)
    get '/api/v1/summon/random'

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status :not_found
    expect(json[:message]).to eq('Nenhum personagem com imagem disponível')
  end
end
