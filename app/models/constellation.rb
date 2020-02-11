# frozen_string_literal: true

class Constellation < ApplicationRecord
  has_many :characters, dependent: :restrict_with_error
  validates :name, presence: true, length: { minimum: 2 }
  validates :name, uniqueness: true
end
