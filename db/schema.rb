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

ActiveRecord::Schema.define(version: 20160324051341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.string   "sizes",                   array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors_models", force: :cascade do |t|
    t.integer  "model_id",   null: false
    t.integer  "color_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors_sizes", force: :cascade do |t|
    t.integer  "size_id",    null: false
    t.integer  "color_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "models", force: :cascade do |t|
    t.string   "code"
    t.integer  "collection_id"
    t.integer  "type_id"
    t.decimal  "price"
    t.string   "image"
    t.string   "sizes",                      array: true
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

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

  add_check "order_products", "(quantity > 0)", name: "ord_prod_quantity_chk"

  create_table "orders", force: :cascade do |t|
    t.string   "order_number",   limit: 20,                          null: false
    t.date     "order_date",                                         null: false
    t.integer  "agent_id",                                           null: false
    t.integer  "contact_id",                                         null: false
    t.integer  "total_quantity"
    t.decimal  "total_price",               precision: 10, scale: 2
    t.decimal  "decimal",                   precision: 10, scale: 2
    t.string   "currency",       limit: 3
    t.decimal  "total_discount",            precision: 10, scale: 2
    t.text     "comment"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "orders", ["agent_id"], name: "i_orders_on_agent_id", using: :btree
  add_index "orders", ["contact_id"], name: "i_orders_on_contact_id", using: :btree
  add_index "orders", ["order_number"], name: "ui_order_number", unique: true, using: :btree

  add_check "orders", "(total_quantity > 0)", name: "order_quantity_chk"
  add_check "orders", "(total_price > (0)::numeric)", name: "order_price_chk"
  add_check "orders", "(total_discount > (0)::numeric)", name: "order_discount_chk"
  add_check "orders", "(total_price > total_discount)", name: "order_price_gt_discount_chk"

  create_table "prices", force: :cascade do |t|
    t.integer  "product_id",                                    null: false
    t.date     "from",                                          null: false
    t.string   "currency",   limit: 3,                          null: false
    t.decimal  "price",                precision: 10, scale: 2, null: false
    t.decimal  "decimal",              precision: 10, scale: 2, null: false
    t.text     "comment"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "prices", ["product_id", "from", "currency"], name: "ui_prices_product_from_curr", unique: true, using: :btree
  add_index "prices", ["product_id"], name: "i_prices_on_product_id", using: :btree

  add_check "prices", "(price > (0)::numeric)", name: "price_price_chk"

  create_table "products", force: :cascade do |t|
    t.string   "code",       limit: 10,  null: false
    t.string   "title",      limit: 100, null: false
    t.string   "color",      limit: 20,  null: false
    t.string   "size",       limit: 10,  null: false
    t.string   "category",   limit: 20,  null: false
    t.binary   "image"
    t.text     "comment"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "products", ["code", "size", "color"], name: "ui_products_code_size", unique: true, using: :btree

  create_table "representatives", force: :cascade do |t|
    t.integer  "company_id",   null: false
    t.integer  "user_id",      null: false
    t.string   "contact_type", null: false
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "representatives", ["company_id", "user_id"], name: "ui_reps", unique: true, using: :btree
  add_index "representatives", ["company_id"], name: "i_reps_on_company_id", using: :btree
  add_index "representatives", ["user_id"], name: "i_reps_on_user_id", using: :btree

  create_table "sizes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.binary   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 100, null: false
    t.string   "fname",           limit: 31,  null: false
    t.string   "lname",           limit: 31,  null: false
    t.string   "password_digest", limit: 100
    t.string   "role",            limit: 10,  null: false
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["email"], name: "ui_users", unique: true, using: :btree

  add_foreign_key "order_products", "orders", name: "fk_ord_prod_on_order_id", on_delete: :cascade
  add_foreign_key "order_products", "products", name: "fk_ord_prod_on_product_id", on_delete: :cascade
  add_foreign_key "prices", "products", name: "fk_prices_on_product_id", on_delete: :cascade
  add_foreign_key "representatives", "companies", name: "fk_reps_on_company_id", on_delete: :cascade
  add_foreign_key "representatives", "users", name: "fk_reps_on_user_id", on_delete: :cascade
end
