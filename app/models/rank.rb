# frozen_string_literal: true

class Rank < ApplicationRecord
  has_many :characters, dependent: :restrict_with_error
  validates :name, uniqueness: true
end
