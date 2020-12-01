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

ActiveRecord::Schema.define(version: 20201201031013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_details", primary_key: ["id_order", "id_product"], force: :cascade do |t|
    t.integer "id_order", null: false
    t.integer "id_product", null: false
    t.integer "quantity"
  end

  create_table "orders", primary_key: "id_order", id: :serial, force: :cascade do |t|
    t.integer "id_store"
    t.integer "total"
  end

  create_table "products", primary_key: "id_product", id: :serial, force: :cascade do |t|
    t.serial "sku", null: false
    t.string "name"
    t.string "typee"
    t.integer "price"
  end

  create_table "store_products", primary_key: ["id_store", "id_product"], force: :cascade do |t|
    t.integer "id_store", null: false
    t.integer "id_product", null: false
  end

  create_table "stores", primary_key: "id_store", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "email"
    t.string "phone"
  end

  add_foreign_key "order_details", "orders", column: "id_order", primary_key: "id_order", name: "order_details_id_order_fkey", on_delete: :cascade
  add_foreign_key "order_details", "products", column: "id_product", primary_key: "id_product", name: "order_details_id_product_fkey", on_delete: :cascade
  add_foreign_key "orders", "stores", column: "id_store", primary_key: "id_store", name: "orders_id_store_fkey", on_delete: :cascade
  add_foreign_key "store_products", "products", column: "id_product", primary_key: "id_product", name: "store_products_id_product_fkey", on_delete: :cascade
  add_foreign_key "store_products", "stores", column: "id_store", primary_key: "id_store", name: "store_products_id_store_fkey", on_delete: :cascade
end
