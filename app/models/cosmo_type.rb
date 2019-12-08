class CosmoType < ApplicationRecord
  validates :name, uniqueness: true
  has_many :cosmos, dependent: :restrict_with_error
end
