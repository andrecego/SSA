class CosmoBasic < ApplicationRecord
  has_and_belongs_to_many :cosmos
  validates :name, uniqueness: true
end
