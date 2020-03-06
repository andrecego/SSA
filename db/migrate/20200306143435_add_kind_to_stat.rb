# frozen_string_literal: true

class AddKindToStat < ActiveRecord::Migration[5.2]
  def change
    add_column :stats, :kind, :integer, default: 0
  end
end
