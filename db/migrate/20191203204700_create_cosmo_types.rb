class CreateCosmoTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :cosmo_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
