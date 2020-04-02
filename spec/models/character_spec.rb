# frozen_string_literal: true

require 'rails_helper'

describe Character do
  describe 'associations' do
    it { should belong_to :rank }
    it { should belong_to :constellation }

    it { should have_one :picture_attachment }
    it { should have_many :stats }
    it { should have_many :skills }
    it { should have_many :cosmos_sets }

    it { should have_and_belong_to_many :banners }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :constellation_id }
    it { should validate_presence_of :rank_id }
  end

  describe '.uniq_name' do
    it 'should turn name + constallation' do
      constellation = create(:constellation, name: 'Andromeda')
      character = create(:character, name: 'Shun', constellation: constellation)

      expect(character.uniq_name).to eq('Shun - Andromeda')
    end
  end
end
