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

ActiveRecord::Schema.define(version: 20151026132637) do

  create_table "flags", force: :cascade do |t|
    t.string   "value"
    t.integer  "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_flags", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "flag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "player_flags", ["flag_id"], name: "index_player_flags_on_flag_id"
  add_index "player_flags", ["player_id"], name: "index_player_flags_on_player_id"

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar",     default: "N04"
    t.string   "password"
    t.integer  "no_flag",    default: 0
    t.integer  "points",     default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "timer",      default: 900
  end

end
