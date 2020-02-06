# frozen_string_literal: true

class Banner < ApplicationRecord
  has_and_belongs_to_many :characters
  has_one_attached :picture
end
