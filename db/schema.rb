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

ActiveRecord::Schema.define(version: 2019_11_12_064942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_cards", force: :cascade do |t|
    t.string "text"
  end

  create_table "elevator_pitches", force: :cascade do |t|
    t.json "board_texts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_id"
    t.index ["product_id"], name: "index_elevator_pitches_on_product_id"
  end

  create_table "lean_canvases", force: :cascade do |t|
    t.json "board_texts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_id"
    t.index ["product_id"], name: "index_lean_canvases_on_product_id"
  end

  create_table "product_backlogs", force: :cascade do |t|
    t.json "board_texts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_id"
    t.index ["product_id"], name: "index_product_backlogs_on_product_id"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_story_maps", force: :cascade do |t|
    t.json "board_texts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_id"
    t.index ["product_id"], name: "index_user_story_maps_on_product_id"
  end

  add_foreign_key "elevator_pitches", "products"
  add_foreign_key "lean_canvases", "products"
  add_foreign_key "product_backlogs", "products"
  add_foreign_key "user_story_maps", "products"
end
