class Skill < ApplicationRecord
  belongs_to :character
  has_many :levels
  has_and_belongs_to_many :effects
end
