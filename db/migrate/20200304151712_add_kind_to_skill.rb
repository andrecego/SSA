# frozen_string_literal: true

class AddKindToSkill < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :kind, :integer, default: 0
  end
end
