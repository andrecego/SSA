class CreateAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :attributes do |t|
      t.integer :health
      t.integer :patk
      t.integer :pdef
      t.integer :matk
      t.integer :mdef
      t.integer :speed
      t.belongs_to :character

      t.timestamps
    end
  end
end
