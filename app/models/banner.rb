class Banner < ApplicationRecord
  belongs_to :character
  has_one_attached :picture
end
