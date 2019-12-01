class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :constellation, foreign_key: true
      t.references :rank, foreign_key: true

      t.timestamps
    end
  end
end
