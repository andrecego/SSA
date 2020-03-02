# frozen_string_literal: true

class CosmoBasic < ApplicationRecord
  # belongs_to :cosmo_type # re fatorar
  has_and_belongs_to_many :cosmos
  validates :name, uniqueness: true
end
