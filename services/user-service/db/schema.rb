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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", primary_key: "orderid", id: :serial, force: :cascade do |t|
    t.string "date", limit: 100, null: false
    t.float "totalprice", null: false
    t.float "rating", null: false
    t.integer "clientid", null: false
    t.integer "locationid", null: false
  end

  create_table "orderxproduct", primary_key: "orderxproductid", id: :serial, force: :cascade do |t|
    t.string "details", limit: 100, null: false
    t.integer "orderid", null: false
    t.integer "productid", null: false
  end

  create_table "users", primary_key: "userid", id: :serial, force: :cascade do |t|
    t.string "firstname", limit: 100, null: false
    t.string "lastname", limit: 100, null: false
    t.string "email", limit: 100, null: false
    t.string "username", limit: 100, null: false
    t.string "password_digest", limit: 100, null: false
    t.integer "usertypeid", null: false
  end

  create_table "usertypes", primary_key: "usertypeid", id: :serial, force: :cascade do |t|
    t.string "typename", limit: 100, null: false
  end

  add_foreign_key "orders", "users", column: "clientid", primary_key: "userid", name: "orders_clientid_fkey"
  add_foreign_key "orderxproduct", "orders", column: "orderid", primary_key: "orderid", name: "orderxproduct_orderid_fkey"
  add_foreign_key "users", "usertypes", column: "usertypeid", primary_key: "usertypeid", name: "users_usertypeid_fkey"
end
