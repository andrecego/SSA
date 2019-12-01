class Constellation < ApplicationRecord
  has_many :characters
  validates :name, presence: true, length: { minimum: 3 }
end