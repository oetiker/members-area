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

ActiveRecord::Schema.define(version: 20170522171722) do

  create_table "songs", force: :cascade do |t|
    t.string   "number"
    t.string   "title"
    t.string   "composer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "sopran"
    t.boolean  "alt"
    t.boolean  "tenor"
    t.boolean  "bass"
    t.boolean  "canon"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "mobil_number"
    t.string   "date_of_joining"
    t.string   "exit_date"
    t.boolean  "choir_active",     default: false,   null: false
    t.string   "role",             default: "guest", null: false
    t.string   "voice"
    t.string   "password_digest"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "changed_password", default: false
  end

end
