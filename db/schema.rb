# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_07_17_142255) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guest_registrations", force: :cascade do |t|
    t.string "country", null: false
    t.string "full_name", null: false
    t.string "rank_title", null: false
    t.string "organization_unit", null: false
    t.string "appointment", null: false
    t.string "travel_mode", null: false
    t.boolean "accommodation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country"], name: "index_guest_registrations_on_country"
    t.index ["full_name"], name: "index_guest_registrations_on_full_name"
    t.index ["organization_unit"], name: "index_guest_registrations_on_organization_unit"
  end

  create_table "team_registrations", force: :cascade do |t|
    t.string "team_captain", null: false
    t.string "organization_unit", null: false
    t.integer "male_count", default: 0, null: false
    t.integer "female_count", default: 0, null: false
    t.integer "total_count", default: 0, null: false
    t.string "player_1", null: false
    t.string "player_2", null: false
    t.string "player_3", null: false
    t.string "player_4", null: false
    t.string "player_5", null: false
    t.string "player_6", null: false
    t.string "player_7", null: false
    t.string "player_8", null: false
    t.string "player_9", null: false
    t.string "player_10", null: false
    t.jsonb "female_categories", default: [], null: false
    t.jsonb "male_categories", default: [], null: false
    t.string "travel_mode", null: false
    t.boolean "accommodation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
