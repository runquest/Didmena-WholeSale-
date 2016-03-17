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

ActiveRecord::Schema.define(version: 20160316020403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name",        limit: 200, null: false
    t.string   "country",     limit: 30,  null: false
    t.string   "city",        limit: 30,  null: false
    t.string   "street",      limit: 30,  null: false
    t.string   "postal_code", limit: 10,  null: false
    t.string   "email",       limit: 100, null: false
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "companies", ["email"], name: "ui_companies_email", unique: true, using: :btree
  add_index "companies", ["name"], name: "ui_companies_name", unique: true, using: :btree

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.integer  "product_id", null: false
    t.integer  "quantity",   null: false
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_products", ["order_id", "product_id"], name: "ui_order_products", unique: true, using: :btree
  add_index "order_products", ["order_id"], name: "i_ord_prod_on_order_id", using: :btree
  add_index "order_products", ["product_id"], name: "i_ord_prod_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "order_number", limit: 20, null: false
    t.date     "order_date",              null: false
    t.integer  "agent_id",                null: false
    t.integer  "contact_id",              null: false
    t.integer  "quantity"
    t.decimal  "price"
    t.string   "currency",     limit: 3
    t.decimal  "discount"
    t.text     "comment"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "orders", ["agent_id"], name: "i_orders_on_agent_id", using: :btree
  add_index "orders", ["contact_id"], name: "i_orders_on_contact_id", using: :btree
  add_index "orders", ["order_number"], name: "ui_order_number", unique: true, using: :btree

  create_table "prices", force: :cascade do |t|
    t.integer  "product_id",           null: false
    t.date     "from",                 null: false
    t.decimal  "price",                null: false
    t.string   "currency",   limit: 3, null: false
    t.text     "comment"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "prices", ["product_id", "from", "currency"], name: "ui_prices_product_from_curr", unique: true, using: :btree
  add_index "prices", ["product_id"], name: "i_prices_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "code",       limit: 10,  null: false
    t.string   "title",      limit: 100, null: false
    t.string   "color",      limit: 20,  null: false
    t.string   "size",       limit: 10,  null: false
    t.string   "category",   limit: 20,  null: false
    t.text     "comment"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "products", ["code", "size"], name: "ui_products_code_size", unique: true, using: :btree
  add_index "products", ["title", "color", "size"], name: "ui_products_tcs", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",       limit: 100, null: false
    t.string   "fname",       limit: 31,  null: false
    t.string   "lname",       limit: 31,  null: false
    t.string   "password",    limit: 100
    t.string   "role",        limit: 10,  null: false
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "users", ["email"], name: "ui_users", unique: true, using: :btree

  add_foreign_key "order_products", "orders", name: "fk_ord_prod_on_order_id", on_delete: :cascade
  add_foreign_key "order_products", "products", name: "fk_ord_prod_on_product_id", on_delete: :cascade
  add_foreign_key "prices", "products", name: "fk_prices_on_product_id", on_delete: :cascade
end
