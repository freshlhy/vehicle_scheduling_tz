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

ActiveRecord::Schema.define(:version => 20121225024056) do

  create_table "cars", :force => true do |t|
    t.string   "model"
    t.string   "plate"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "current_trip", :default => 0
    t.integer  "load_limit"
  end

  create_table "destinations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "driverships", :force => true do |t|
    t.integer  "car_id"
    t.integer  "driver_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "driverships", ["car_id"], :name => "index_driverships_on_car_id"
  add_index "driverships", ["driver_id"], :name => "index_driverships_on_driver_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trip_users", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "trip_id"
  end

  add_index "trip_users", ["user_id"], :name => "index_trip_users_on_user_id", :unique => true

  create_table "trips", :force => true do |t|
    t.date     "departure_time"
    t.date     "back_time"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "note_id"
    t.integer  "destination_id"
    t.integer  "drivership_id"
    t.string   "workers_ids"
    t.boolean  "ing",            :default => false
    t.string   "workers_names"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "current_trip",    :default => 0
    t.string   "phone"
    t.integer  "group_id"
    t.string   "type"
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "workerships", :force => true do |t|
    t.integer  "trip_id"
    t.integer  "worker_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "workerships", ["trip_id"], :name => "index_workerships_on_trip_id"
  add_index "workerships", ["worker_id"], :name => "index_workerships_on_worker_id"

end
