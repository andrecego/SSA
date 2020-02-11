# frozen_string_literal: true

class Cosmo < ApplicationRecord
  has_many :cosmo_basics, through: :cosmo_basics_cosmos
  belongs_to :cosmo_type
  has_one_attached :picture
end
