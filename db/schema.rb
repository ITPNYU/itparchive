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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111022203248) do

  create_table "documentations", :force => true do |t|
    t.string   "type"
    t.integer  "condition"
    t.integer  "thesis_id"
    t.string   "title"
    t.text     "paper"
    t.string   "media_file_name"
    t.string   "media_content_type"
    t.integer  "media_file_size"
    t.datetime "media_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "integrity"
    t.boolean  "flag"
  end

  create_table "people", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.integer  "year"
    t.integer  "thesis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "theses", :force => true do |t|
    t.string   "title"
    t.integer  "year"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
