class CreateJoinTableCosmoBasicCosmo < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cosmo_basics, :cosmos do |t|
      t.index [:cosmo_basic_id, :cosmo_id]
      t.index [:cosmo_id, :cosmo_basic_id]
    end
  end
end