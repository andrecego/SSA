class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :cost
      t.text :description

      t.timestamps
    end
  end
end
