class CosmoType < ApplicationRecord
  validates :name, uniqueness: true
end
