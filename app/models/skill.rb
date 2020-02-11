# frozen_string_literal: true

class Skill < ApplicationRecord
  belongs_to :character
  has_many :effects, through: :effects_skills
  has_one_attached :picture
end
