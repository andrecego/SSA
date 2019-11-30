class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.integer :health
      t.integer :patk
      t.integer :pdef
      t.integer :matk
      t.integer :mdef
      t.integer :speed
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
