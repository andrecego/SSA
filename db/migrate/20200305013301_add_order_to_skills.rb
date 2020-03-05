# frozen_string_literal: true

class AddOrderToSkills < ActiveRecord::Migration[5.2]
  def up
    add_column :skills, :order, :integer
    Character.all.each do |character|
      character.skills.reverse.each.with_index do |skill, i|
        skill.update(order: i + 1)
      end
    end
  end

  def down
    remove_column :skills, :order, :integer
  end
end
