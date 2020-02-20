# frozen_string_literal: true

class Cosmo < ApplicationRecord
  belongs_to :cosmo_type
  has_and_belongs_to_many :cosmo_basics
  has_one_attached :picture
end
