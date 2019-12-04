class Cosmo < ApplicationRecord
  has_and_belongs_to_many :cosmo_basics
  belongs_to :cosmo_type
end
