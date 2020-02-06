# frozen_string_literal: true

class CreateCharactersBannersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :characters, :banners do |t|
      t.index %i[character_id banner_id]
      t.index %i[banner_id character_id]
    end
  end
end
