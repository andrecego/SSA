class Character < ApplicationRecord
  belongs_to :rank
  belongs_to :constellation
  has_one :stat, dependent: :destroy
  has_many :skills, dependent: :destroy
  accepts_nested_attributes_for :stat, :skills
end