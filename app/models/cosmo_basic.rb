# frozen_string_literal: true

class CosmoBasic < ApplicationRecord
  belongs_to :cosmo_type
  has_and_belongs_to_many :cosmos
  validates :name, uniqueness: true
end
