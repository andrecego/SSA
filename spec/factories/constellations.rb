# frozen_string_literal: true

FactoryBot.define do
  factory :constellation do
    sequence(:name) { |n| "Peixes-#{n}" }

    trait :with_picture do
      picture_path = Rails.root.join('spec/support/assets/character-image.png')
      picture { Rack::Test::UploadedFile.new(picture_path, 'image/png') }
    end
  end
end
