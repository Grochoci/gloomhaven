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

ActiveRecord::Schema.define(version: 2018_11_12_001647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.boolean "reshuffle"
    t.string "ability_image"
  end

  create_table "ability_deck_abilities", force: :cascade do |t|
    t.bigint "ability_deck_id"
    t.bigint "ability_id"
    t.index ["ability_deck_id"], name: "index_ability_deck_abilities_on_ability_deck_id"
    t.index ["ability_id"], name: "index_ability_deck_abilities_on_ability_id"
  end

  create_table "ability_decks", force: :cascade do |t|
    t.string "name"
    t.string "back_image"
    t.index ["name"], name: "index_ability_decks_on_name"
  end

  create_table "monster_stats", force: :cascade do |t|
    t.bigint "monster_id"
    t.integer "level"
    t.boolean "is_elite"
    t.integer "health"
    t.integer "attack"
    t.integer "movement"
    t.integer "range"
    t.index ["level"], name: "index_monster_stats_on_level"
    t.index ["monster_id"], name: "index_monster_stats_on_monster_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.string "portrait"
    t.boolean "is_boss"
    t.bigint "ability_deck_id"
    t.index ["ability_deck_id"], name: "index_monsters_on_ability_deck_id"
  end

  create_table "scenario_monsters", force: :cascade do |t|
    t.bigint "scenario_id"
    t.bigint "monster_id"
    t.index ["monster_id"], name: "index_scenario_monsters_on_monster_id"
    t.index ["scenario_id"], name: "index_scenario_monsters_on_scenario_id"
  end

  create_table "scenarios", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.index ["number"], name: "index_scenarios_on_number"
  end

  add_foreign_key "ability_deck_abilities", "abilities"
  add_foreign_key "ability_deck_abilities", "ability_decks"
  add_foreign_key "monster_stats", "monsters"
  add_foreign_key "monsters", "ability_decks"
  add_foreign_key "scenario_monsters", "monsters"
  add_foreign_key "scenario_monsters", "scenarios"
end
