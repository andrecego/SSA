# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'some@user.com' }
    password { 'hunter2' }

    trait :admin do
      role { 'admin' }
    end
  end
end
