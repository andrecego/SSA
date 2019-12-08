class Constellation < ApplicationRecord
  has_many :characters, dependent: :restrict_with_error
  validates :name, presence: true, length: { minimum: 3 }
  validates :name, uniqueness: true
end
