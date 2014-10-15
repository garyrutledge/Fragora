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

ActiveRecord::Schema.define(:version => 20141010233856) do

  create_table "award_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "awards", :force => true do |t|
    t.integer  "user_id"
    t.integer  "award_type_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "user_id"
    t.integer  "kill"
    t.integer  "deaths"
    t.integer  "shots_fired"
    t.integer  "shots_hit"
    t.float    "accuracy"
    t.integer  "headshots"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "round"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "total_kills"
    t.integer  "total_deaths"
    t.float    "kdr"
    t.integer  "total_headshots"
    t.float    "average_accuracy"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
