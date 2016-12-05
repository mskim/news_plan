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

ActiveRecord::Schema.define(version: 20161205065328) do

  create_table "ad_templates", force: :cascade do |t|
    t.string   "name"
    t.string   "column_count"
    t.string   "grid_width"
    t.string   "grid_height"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "ads", force: :cascade do |t|
    t.string   "section_id"
    t.string   "integer"
    t.string   "ad_type"
    t.string   "advertiser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "article_boxes", force: :cascade do |t|
    t.text     "grid_frame"
    t.integer  "section_template_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "issues", force: :cascade do |t|
    t.integer  "publication_id"
    t.date     "date"
    t.text     "spread_plan"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "publications", force: :cascade do |t|
    t.string   "name"
    t.string   "paper_size"
    t.float    "width"
    t.float    "height"
    t.float    "margin"
    t.integer  "page_count"
    t.text     "sections"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "section_templates", force: :cascade do |t|
    t.string   "grid_base"
    t.string   "grid_key"
    t.boolean  "has_heading"
    t.string   "ad_key"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "name"
    t.integer  "page_number"
    t.boolean  "color_page"
    t.boolean  "has_heading"
    t.string   "grid_base"
    t.string   "ad_type"
    t.integer  "box_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
