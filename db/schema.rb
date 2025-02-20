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

ActiveRecord::Schema.define(version: 20190707160308) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "genre"
  end

  create_table "fans", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password"
  end

  create_table "gigs", force: :cascade do |t|
    t.integer  "fan_id"
    t.integer  "artist_id"
    t.string   "name"
    t.string   "city"
    t.string   "venue"
    t.text     "address"
    t.string   "postcode"
    t.datetime "date"
    t.integer  "start_time"
    t.integer  "end_time"
    t.boolean  "past"
  end

end
