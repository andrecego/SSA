class CreateCosmosSets < ActiveRecord::Migration[5.2]
  def change
    create_table :cosmos_sets do |t|
      t.text :cosmos_ids, array: true
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
