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

ActiveRecord::Schema.define(version: 2021_03_02_184213) do


  create_table "newpokemons", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "move"
    t.integer "user_id"
    t.integer "pokemon_id"
    t.index ["pokemon_id"], name: "index_newpokemons_on_pokemon_id"
    t.index ["user_id"], name: "index_newpokemons_on_user_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "move"
    t.integer "user_id"
    t.index ["user_id"], name: "index_pokemons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.text "pokemon"
  end

end
