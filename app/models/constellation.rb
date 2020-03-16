# frozen_string_literal: true

class Constellation < ApplicationRecord
  has_many :characters, dependent: :restrict_with_error
  has_one_attached :picture
  validates :name, presence: true, length: { minimum: 2 }
  validates :name, uniqueness: true
end
