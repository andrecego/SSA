# frozen_string_literal: true

class Character < ApplicationRecord
  belongs_to :rank
  belongs_to :constellation
  has_one_attached :picture
  has_one :stat, dependent: :destroy
  has_many :banners, through: :banners_characters
  has_many :skills, dependent: :destroy
  has_many :cosmos_sets, dependent: :destroy
  has_and_belongs_to_many :banners
  validates :name, :constellation_id, :rank_id, presence: true

  def uniq_name
    "#{name} - #{constellation.name}"
  end
end
