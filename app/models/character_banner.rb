class CharacterBanner < ApplicationRecord
  belongs_to :banner
  belongs_to :character
end