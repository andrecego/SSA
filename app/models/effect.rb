# frozen_string_literal: true

class Effect < ApplicationRecord
  validates :name, uniqueness: true
  has_and_belongs_to_many :skills
end
