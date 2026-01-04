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

ActiveRecord::Schema[8.1].define(version: 2026_01_04_151834) do
  create_table "game_moves", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "game_id", null: false
    t.integer "move_id", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_moves_on_game_id"
    t.index ["move_id"], name: "index_game_moves_on_move_id"
  end

  create_table "game_studies", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.integer "game_id", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_studies_on_game_id"
  end

  create_table "game_study_moves", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "game_study_id", null: false
    t.integer "move_id", null: false
    t.datetime "updated_at", null: false
    t.index ["game_study_id"], name: "index_game_study_moves_on_game_study_id"
    t.index ["move_id"], name: "index_game_study_moves_on_move_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "black"
    t.datetime "created_at", null: false
    t.string "pgn"
    t.date "played"
    t.string "result"
    t.datetime "updated_at", null: false
    t.string "white"
  end

  create_table "moves", force: :cascade do |t|
    t.string "after"
    t.string "before"
    t.string "captured"
    t.string "color"
    t.datetime "created_at", null: false
    t.string "flags"
    t.string "from"
    t.string "lan"
    t.string "piece"
    t.string "promotion"
    t.string "san"
    t.string "to"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "game_moves", "games"
  add_foreign_key "game_moves", "moves"
  add_foreign_key "game_studies", "games"
  add_foreign_key "game_study_moves", "game_studies"
  add_foreign_key "game_study_moves", "moves"
end
