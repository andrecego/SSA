class CreateConstellations < ActiveRecord::Migration[5.2]
  def change
    create_table :constellations do |t|
      t.string :name

      t.timestamps
    end
  end
end
