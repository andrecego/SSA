class RemoveCharacterFromBanner < ActiveRecord::Migration[5.2]
  def change
    remove_reference :banners, :character, foreign_key: true
  end
end
