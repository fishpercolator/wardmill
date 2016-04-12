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

ActiveRecord::Schema.define(version: 20160412143430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_rows", force: :cascade do |t|
    t.integer  "dataset_id"
    t.integer  "ward_id"
    t.string   "row"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "data_rows", ["dataset_id"], name: "index_data_rows_on_dataset_id", using: :btree
  add_index "data_rows", ["ward_id"], name: "index_data_rows_on_ward_id", using: :btree

  create_table "datasets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  create_table "postcodes", force: :cascade do |t|
    t.string   "code"
    t.integer  "ward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "postcodes", ["ward_id"], name: "index_postcodes_on_ward_id", using: :btree

  create_table "wards", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "data_rows", "datasets"
  add_foreign_key "data_rows", "wards"
  add_foreign_key "postcodes", "wards"
end
