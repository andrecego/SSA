# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_30_173725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "effects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "effects_skills", id: false, force: :cascade do |t|
    t.bigint "effect_id", null: false
    t.bigint "skill_id", null: false
    t.index ["effect_id", "skill_id"], name: "index_effects_skills_on_effect_id_and_skill_id"
    t.index ["skill_id", "effect_id"], name: "index_effects_skills_on_skill_id_and_effect_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "cost"
    t.text "description"
    t.text "skill_up", array: true
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_skills_on_character_id"
  end

  create_table "stats", force: :cascade do |t|
    t.integer "health"
    t.integer "patk"
    t.integer "pdef"
    t.integer "matk"
    t.integer "mdef"
    t.integer "speed"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_stats_on_character_id"
  end

  add_foreign_key "skills", "characters"
  add_foreign_key "stats", "characters"
end
