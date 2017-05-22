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

ActiveRecord::Schema.define(version: 20170522214353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lunches", force: :cascade do |t|
    t.string   "name",          null: false
    t.integer  "restaurant_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["name"], name: "index_lunches_on_name", unique: true, using: :btree
    t.index ["restaurant_id"], name: "index_lunches_on_restaurant_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "logo"
    t.string   "yelp_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["logo"], name: "index_restaurants_on_logo", using: :btree
    t.index ["name"], name: "index_restaurants_on_name", unique: true, using: :btree
    t.index ["yelp_link"], name: "index_restaurants_on_yelp_link", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating",     null: false
    t.integer  "user_id",    null: false
    t.integer  "lunch_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lunch_id"], name: "index_reviews_on_lunch_id", using: :btree
    t.index ["rating"], name: "index_reviews_on_rating", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "name"
    t.string   "team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", using: :btree
    t.index ["team"], name: "index_users_on_team", using: :btree
  end

end
