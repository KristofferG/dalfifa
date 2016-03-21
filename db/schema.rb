# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160320212014) do

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "cup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["cup_id"], name: "index_comments_on_cup_id"

  create_table "cups", force: :cascade do |t|
    t.string   "title"
    t.integer  "num_players"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "official"
  end

  create_table "cups_players", id: false, force: :cascade do |t|
    t.integer "cup_id"
    t.integer "player_id"
  end

  create_table "fixtures", force: :cascade do |t|
    t.integer  "games_assigned"
    t.text     "coop"
    t.integer  "games_played"
    t.integer  "home"
    t.integer  "away"
    t.integer  "points"
    t.integer  "goals_f"
    t.integer  "goals_a"
    t.integer  "cup_id"
    t.integer  "player_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "fixtures", ["cup_id"], name: "index_fixtures_on_cup_id"
  add_index "fixtures", ["player_id"], name: "index_fixtures_on_player_id"

  create_table "matches", force: :cascade do |t|
    t.integer  "team1_score"
    t.integer  "team2_score"
    t.integer  "cup_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "matches", ["cup_id"], name: "index_matches_on_cup_id"

  create_table "matches_players", id: false, force: :cascade do |t|
    t.integer "match_id"
    t.integer "player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "games_played"
    t.integer  "goals_f"
    t.integer  "goals_a"
    t.integer  "points"
    t.integer  "goals"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "plus_minus"
  end

  create_table "results", force: :cascade do |t|
    t.integer  "points"
    t.integer  "goals_f"
    t.integer  "goals_a"
    t.integer  "coop"
    t.text     "opps"
    t.integer  "cup"
    t.integer  "match_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "results", ["match_id"], name: "index_results_on_match_id"
  add_index "results", ["player_id"], name: "index_results_on_player_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
