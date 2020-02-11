# frozen_string_literal: true

class Effect < ApplicationRecord
  has_many :skills, through: :effects_skills
  validates :name, uniqueness: true
end
