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

  create_table "locations", primary_key: "locationId", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "locationName", limit: 100, null: false
    t.string "locationAddress", limit: 100, null: false
    t.decimal "locationRating", precision: 10, null: false
    t.integer "restaurantId", null: false
    t.index ["restaurantId"], name: "fk_restaurant"
  end

  create_table "orderXproduct", primary_key: "orderXproductId", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "details", limit: 100, null: false
    t.integer "orderId", null: false
    t.integer "productId", null: false
    t.index ["orderId"], name: "fk_order"
    t.index ["productId"], name: "fk_product"
  end

  create_table "orders", primary_key: "orderId", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "orderDate", limit: 100, null: false
    t.decimal "orderTotalPrice", precision: 10, null: false
    t.decimal "orderRating", precision: 10, null: false
    t.integer "clientid", null: false
    t.integer "locationId", null: false
    t.index ["clientid"], name: "fk_client"
    t.index ["locationId"], name: "fk_location"
  end

  create_table "products", primary_key: "productid", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "description", limit: 100, null: false
    t.string "imageurl", limit: 100, null: false
    t.decimal "price", precision: 10, null: false
  end

  create_table "restaurants", primary_key: "restaurantid", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "description", limit: 100, null: false
    t.string "tags", limit: 100, null: false
    t.integer "ownerid", null: false
    t.index ["ownerid"], name: "fk_owner"
  end

  create_table "users", primary_key: "userid", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "firstname", limit: 100, null: false
    t.string "lastname", limit: 100, null: false
    t.string "email", limit: 100, null: false
    t.string "username", limit: 100, null: false
    t.string "password_digest", limit: 100, null: false
    t.integer "usertypeid", null: false
    t.index ["usertypeid"], name: "fk_usertype"
  end

  create_table "usertypes", primary_key: "usertypeid", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "typename", limit: 100, null: false
  end

  add_foreign_key "locations", "restaurants", column: "restaurantId", primary_key: "restaurantid", name: "fk_restaurant"
  add_foreign_key "orderXproduct", "orders", column: "orderId", primary_key: "orderId", name: "fk_order"
  add_foreign_key "orderXproduct", "products", column: "productId", primary_key: "productid", name: "fk_product"
  add_foreign_key "orders", "locations", column: "locationId", primary_key: "locationId", name: "fk_location"
  add_foreign_key "orders", "users", column: "clientid", primary_key: "userid", name: "fk_client"
  add_foreign_key "restaurants", "users", column: "ownerid", primary_key: "userid", name: "fk_owner"
  add_foreign_key "users", "usertypes", column: "usertypeid", primary_key: "usertypeid", name: "fk_usertype"
end
