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

ActiveRecord::Schema.define(version: 20161103072154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessment_subtypes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "assessment_type_id"
    t.index ["assessment_type_id"], name: "index_assessment_subtypes_on_assessment_type_id", using: :btree
  end

  create_table "assessment_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "year_id"
    t.boolean  "rp_flag"
    t.index ["year_id"], name: "index_assessment_types_on_year_id", using: :btree
  end

  create_table "assessment_units", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "assessment_subtype_id"
    t.index ["assessment_subtype_id"], name: "index_assessment_units_on_assessment_subtype_id", using: :btree
  end

  create_table "input_data", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "item_id"
    t.index ["item_id"], name: "index_input_data_on_item_id", using: :btree
  end

  create_table "input_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "part_id"
    t.index ["part_id"], name: "index_items_on_part_id", using: :btree
  end

  create_table "parts", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "assessment_unit_id"
    t.index ["assessment_unit_id"], name: "index_parts_on_assessment_unit_id", using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "years", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assessment_subtypes", "assessment_types"
  add_foreign_key "assessment_types", "years"
  add_foreign_key "assessment_units", "assessment_subtypes"
  add_foreign_key "input_data", "items"
  add_foreign_key "items", "parts"
  add_foreign_key "parts", "assessment_units"
end
