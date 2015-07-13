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

ActiveRecord::Schema.define(version: 20150713090332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.integer "user_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "immat"
    t.string  "phone"
    t.string  "address"
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "invoiced_parts", force: :cascade do |t|
    t.integer "invoice_id"
    t.integer "part_id"
    t.integer "price_ttc_cents",    default: 0,     null: false
    t.string  "price_ttc_currency", default: "EUR", null: false
    t.integer "price_ht_cents",     default: 0,     null: false
    t.string  "price_ht_currency",  default: "EUR", null: false
    t.string  "ref"
    t.integer "discount_provider"
    t.integer "quantity"
  end

  add_index "invoiced_parts", ["invoice_id"], name: "index_invoiced_parts_on_invoice_id", using: :btree
  add_index "invoiced_parts", ["part_id"], name: "index_invoiced_parts_on_part_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.date     "date"
    t.text     "description_mo"
    t.float    "time_mo"
    t.integer  "total_price_cents",    default: 0,     null: false
    t.string   "total_price_currency", default: "EUR", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price_mo_cents",       default: 0,     null: false
    t.string   "price_mo_currency",    default: "EUR", null: false
  end

  add_index "invoices", ["customer_id"], name: "index_invoices_on_customer_id", using: :btree
  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id", using: :btree

  create_table "parts", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                   default: "",    null: false
    t.string   "encrypted_password",      default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "phone"
    t.string   "siret"
    t.integer  "price_per_hour_cents",    default: 0,     null: false
    t.string   "price_per_hour_currency", default: "EUR", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
