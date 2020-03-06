# frozen_string_literal: true

class Stat < ApplicationRecord
  belongs_to :character
  validates :kind, uniqueness: { scope: [:character_id],
                                 message: 'já cadastrado para esse personagem' }
  enum kind: { default: 0, cloth: 5 }
end
