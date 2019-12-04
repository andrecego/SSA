class CreateCosmos < ActiveRecord::Migration[5.2]
  def change
    create_table :cosmos do |t|
      t.string :name
      t.references :cosmo_type, foreign_key: true

      t.timestamps
    end
  end
end
