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

ActiveRecord::Schema.define(:version => 20111205154450) do

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
    t.string   "physical_location"
    t.boolean  "has_images"
    t.string   "medium"
  end

  create_table "favorites", :force => true do |t|
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "favoritable_type"
    t.integer   "favoritable_id"
  end

  create_table "media", :force => true do |t|
    t.string    "kind"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.text      "body"
    t.integer   "user_id"
    t.string    "notable_type"
    t.integer   "notable_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string    "first"
    t.string    "last"
    t.integer   "year"
    t.integer   "thesis_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "reads", :force => true do |t|
    t.string   "readable_type"
    t.integer  "readable_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "theses", :force => true do |t|
    t.string    "title"
    t.integer   "year"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                                 :default => "", :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
