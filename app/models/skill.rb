# frozen_string_literal: true

class Skill < ApplicationRecord
  belongs_to :character
  has_one_attached :picture
  has_and_belongs_to_many :effects
  validates :name, presence: true

  enum kind: { default: 0, cloth: 5 }
end
