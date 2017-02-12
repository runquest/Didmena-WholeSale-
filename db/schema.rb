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

ActiveRecord::Schema.define(version: 20170209003953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "title",       limit: 200,                          null: false
    t.string   "email",       limit: 100,                          null: false
    t.string   "status",      limit: 20,                           null: false
    t.decimal  "discount",                precision: 10, scale: 2
    t.integer  "domain_id",                                        null: false
    t.string   "city",        limit: 30
    t.string   "street",      limit: 30
    t.string   "postal_code", limit: 10
    t.string   "phone",       limit: 100
    t.text     "description"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "companies", ["domain_id"], name: "i_companies_on_domain_id", using: :btree
  add_index "companies", ["email"], name: "ui_companies_email", unique: true, using: :btree
  add_index "companies", ["title"], name: "ui_companies_title", unique: true, using: :btree

  add_check "companies", "((status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying, 'flagged'::character varying])::text[]))", name: "company_status_chk"

  create_table "domains", force: :cascade do |t|
    t.string "domain_name",  limit: 20,  null: false
    t.string "code_value",   limit: 10,  null: false
    t.string "meaning",      limit: 100
    t.string "special_case", limit: 10
    t.text   "note"
  end

  add_index "domains", ["domain_name", "code_value"], name: "ui_domains_name_value", unique: true, using: :btree

  add_check "domains", "((domain_name)::text = ANY ((ARRAY['Gender'::character varying, 'Color'::character varying, 'Size'::character varying, 'Season'::character varying, 'Agegroup'::character varying, 'Country'::character varying, 'Currency'::character varying])::text[]))", name: "domain_name_chk"

  create_table "model_attachments", force: :cascade do |t|
    t.integer  "model_id"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "code",        limit: 10,                           null: false
    t.string   "title",       limit: 100,                          null: false
    t.integer  "gender_id",                                        null: false
    t.integer  "category_id",                                      null: false
    t.integer  "priority"
    t.decimal  "price",                   precision: 10, scale: 2, null: false
    t.text     "note"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "models", ["category_id"], name: "i_models_on_category_id", using: :btree
  add_index "models", ["code"], name: "ui_model_code", unique: true, using: :btree
  add_index "models", ["gender_id"], name: "i_models_on_gender_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "order_number",   limit: 20,                           null: false
    t.date     "order_date",                                          null: false
    t.integer  "total_quantity"
    t.decimal  "total_price",                precision: 10, scale: 2
    t.decimal  "discount",                   precision: 10, scale: 2
    t.integer  "domain_id"
    t.string   "contact",        limit: 100
    t.text     "note"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "orders", ["domain_id"], name: "i_orders_on_domain_id", using: :btree
  add_index "orders", ["order_number"], name: "ui_order_number", unique: true, using: :btree

  add_check "orders", "(total_quantity > 0)", name: "order_total_quantity_chk"
  add_check "orders", "(total_price > (0)::numeric)", name: "order_total_price_chk"
  add_check "orders", "(discount > (0)::numeric)", name: "order_discount_chk"
  add_check "orders", "(total_price > discount)", name: "order_total_price_gt_discount_chk"

  create_table "products", force: :cascade do |t|
    t.integer  "model_id",   null: false
    t.integer  "color_id",   null: false
    t.integer  "size_id",    null: false
    t.boolean  "in_storage"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "products", ["color_id"], name: "i_products_on_color_id", using: :btree
  add_index "products", ["model_id", "color_id", "size_id"], name: "ui_products_model_color_size", unique: true, using: :btree
  add_index "products", ["model_id"], name: "i_products_on_model_id", using: :btree
  add_index "products", ["size_id"], name: "i_products_on_size_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.integer  "product_id", null: false
    t.integer  "quantity",   null: false
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "purchases", ["order_id", "product_id"], name: "ui_purchases", unique: true, using: :btree
  add_index "purchases", ["order_id"], name: "i_purchase_on_order_id", using: :btree
  add_index "purchases", ["product_id"], name: "i_purchase_on_product_id", using: :btree

  add_check "purchases", "(quantity > 0)", name: "purchase_quantity_chk"

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 100, null: false
    t.string   "fname",           limit: 31,  null: false
    t.string   "lname",           limit: 31,  null: false
    t.string   "password_digest",             null: false
    t.string   "status",          limit: 20,  null: false
    t.integer  "company_id"
    t.boolean  "apps_manager"
    t.string   "phone",           limit: 100
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["email"], name: "ui_users_email", unique: true, using: :btree

  add_check "users", "((status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying, 'flagged'::character varying])::text[]))", name: "user_status_chk"

  add_foreign_key "companies", "domains", name: "fk_companies_on_domain_id"
  add_foreign_key "models", "domains", column: "category_id", name: "fk_models_on_category_id"
  add_foreign_key "models", "domains", column: "gender_id", name: "fk_models_on_gender_id"
  add_foreign_key "orders", "domains", name: "fk_orders_on_domain_id"
  add_foreign_key "products", "domains", column: "color_id", name: "fk_products_on_color_id"
  add_foreign_key "products", "domains", column: "size_id", name: "fk_products_on_size_id"
  add_foreign_key "products", "models", name: "fk_products_on_model_id"
  add_foreign_key "purchases", "orders", name: "fk_purchase_on_order_id", on_delete: :cascade
  add_foreign_key "purchases", "products", name: "fk_purchase_on_product_id", on_delete: :cascade
end
