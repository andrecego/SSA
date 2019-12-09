class Skill < ApplicationRecord
  belongs_to :character
  has_and_belongs_to_many :effects
  has_one_attached :picture
end
