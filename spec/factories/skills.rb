# frozen_string_literal: true

FactoryBot.define do
  factory :skill do
    name { 'Ice Punch' }
    cost { '2' }
    description { 'Deals 120% damage' }
    kind { 'default' }
    levels { ['120% dmg', '130% dmg', '140% dmg', '150% dmg', '160% dmg'] }
    character

    trait :with_picture do
      picture_path = Rails.root.join('spec/support/assets/skill-img.png')
      picture { Rack::Test::UploadedFile.new(picture_path, 'image/png') }
    end
  end
end
