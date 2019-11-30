class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.string :text
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
