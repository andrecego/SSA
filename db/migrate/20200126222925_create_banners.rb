class CreateBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :banners do |t|
      t.datetime :initial_date
      t.datetime :end_date
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
