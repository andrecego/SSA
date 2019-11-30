class CreateJoinTableEffectSkill < ActiveRecord::Migration[5.2]
  def change
    create_join_table :effects, :skills do |t|
      t.index [:effect_id, :skill_id]
      t.index [:skill_id, :effect_id]
    end
  end
end
