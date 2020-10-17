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

ActiveRecord::Schema.define(version: 2020_10_16_135623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feature_teams", force: :cascade do |t|
    t.bigint "feature_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_feature_teams_on_feature_id"
    t.index ["team_id"], name: "index_feature_teams_on_team_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "label", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", default: "", null: false
  end

  add_foreign_key "feature_teams", "features"
  add_foreign_key "feature_teams", "teams"
end
