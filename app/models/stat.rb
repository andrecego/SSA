# frozen_string_literal: true

class Stat < ApplicationRecord
  belongs_to :character
  validates :kind, uniqueness: { scope: [:character_id],
                                 message: 'já cadastrado para esse personagem' }
  validates :health, :patk, :pdef, :speed, :matk, :mdef,
            numericality: { only_integer: true }

  enum kind: { default: 0, cloth: 5 }
end
