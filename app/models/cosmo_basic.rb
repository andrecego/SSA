# frozen_string_literal: true

class CosmoBasic < ApplicationRecord
  has_many :cosmos, through: :cosmo_basics_cosmos
  validates :name, uniqueness: true
end
