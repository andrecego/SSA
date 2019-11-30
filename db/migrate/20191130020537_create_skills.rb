class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :cost
      t.text :description
      t.references :character, foreign_key: true
      
      t.timestamps
    end
  end
end