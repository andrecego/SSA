# frozen_string_literal: true

class AddCoordinatesToConstellation < ActiveRecord::Migration[6.0]
  def change
    add_column :constellations, :latitude, :decimal, precision: 3, scale: 2, default: 0
    add_column :constellations, :longitude, :decimal, precision: 3, scale: 2, default: 0
  end
end
