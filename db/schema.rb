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

ActiveRecord::Schema.define(version: 2020_03_04_151712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_imgur_key_mappings", force: :cascade do |t|
    t.string "key", null: false
    t.string "imgur_id", null: false
    t.index ["key"], name: "index_active_storage_imgur_key_mappings_on_key", unique: true
  end

  create_table "banners", force: :cascade do |t|
    t.datetime "initial_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banners_characters", id: false, force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "banner_id", null: false
    t.index ["banner_id", "character_id"], name: "index_banners_characters_on_banner_id_and_character_id"
    t.index ["character_id", "banner_id"], name: "index_banners_characters_on_character_id_and_banner_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.bigint "constellation_id"
    t.bigint "rank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["constellation_id"], name: "index_characters_on_constellation_id"
    t.index ["rank_id"], name: "index_characters_on_rank_id"
  end

  create_table "constellations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cosmo_basics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cosmo_basics_cosmos", id: false, force: :cascade do |t|
    t.bigint "cosmo_basic_id", null: false
    t.bigint "cosmo_id", null: false
    t.index ["cosmo_basic_id", "cosmo_id"], name: "index_cosmo_basics_cosmos_on_cosmo_basic_id_and_cosmo_id"
    t.index ["cosmo_id", "cosmo_basic_id"], name: "index_cosmo_basics_cosmos_on_cosmo_id_and_cosmo_basic_id"
  end

  create_table "cosmo_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cosmos", force: :cascade do |t|
    t.string "name"
    t.string "set"
    t.bigint "cosmo_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cosmo_type_id"], name: "index_cosmos_on_cosmo_type_id"
  end

  create_table "cosmos_sets", force: :cascade do |t|
    t.text "cosmos_ids", array: true
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_cosmos_sets_on_character_id"
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

  create_table "ranks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "cost"
    t.text "description"
    t.string "levels", default: [], array: true
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind", default: 0
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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "characters", "constellations"
  add_foreign_key "characters", "ranks"
  add_foreign_key "cosmos", "cosmo_types"
  add_foreign_key "cosmos_sets", "characters"
  add_foreign_key "skills", "characters"
  add_foreign_key "stats", "characters"
end
