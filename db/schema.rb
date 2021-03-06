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

ActiveRecord::Schema.define(version: 20160727155517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "shortname"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "location"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "location_id"
    t.boolean  "removed",     default: false
  end

  add_index "companies", ["location_id"], name: "index_companies_on_location_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "company_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.integer  "location_id"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "items", ["company_id"], name: "index_items_on_company_id", using: :btree
  add_index "items", ["location_id"], name: "index_items_on_location_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_foreign_key "companies", "locations"
  add_foreign_key "items", "companies"
  add_foreign_key "items", "locations"
end
