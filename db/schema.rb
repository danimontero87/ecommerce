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

ActiveRecord::Schema.define(version: 20160624080212) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "user_id"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "state",              default: "in_draft"
    t.integer  "visits_count"
    t.integer  "points"
    t.text     "markup_body"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "attachments", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "archivo_file_name"
    t.string   "archivo_content_type"
    t.integer  "archivo_file_size"
    t.datetime "archivo_updated_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "attachments", ["product_id"], name: "index_attachments_on_product_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "color"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "genders", force: :cascade do |t|
    t.string  "name"
    t.integer "categories_id"
    t.integer "category_id"
  end

  add_index "genders", ["categories_id"], name: "index_genders_on_categories_id"
  add_index "genders", ["category_id"], name: "index_genders_on_category_id"

  create_table "has_categories", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "has_categories", ["article_id"], name: "index_has_categories_on_article_id"
  add_index "has_categories", ["category_id"], name: "index_has_categories_on_category_id"

  create_table "has_genders", force: :cascade do |t|
    t.integer "article_id"
    t.integer "gender_id"
  end

  add_index "has_genders", ["article_id"], name: "index_has_genders_on_article_id"
  add_index "has_genders", ["gender_id"], name: "index_has_genders_on_gender_id"

  create_table "has_subcategories", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "subcategory_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "has_subcategories", ["article_id"], name: "index_has_subcategories_on_article_id"
  add_index "has_subcategories", ["subcategory_id"], name: "index_has_subcategories_on_subcategory_id"

  create_table "in_shopping_carts", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "shopping_cart_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "in_shopping_carts", ["product_id"], name: "index_in_shopping_carts_on_product_id"
  add_index "in_shopping_carts", ["shopping_cart_id"], name: "index_in_shopping_carts_on_shopping_cart_id"

  create_table "my_emails", force: :cascade do |t|
    t.string   "email"
    t.string   "ip"
    t.integer  "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_payments", force: :cascade do |t|
    t.string   "email"
    t.string   "ip"
    t.string   "status"
    t.decimal  "fee",              precision: 6, scale: 2
    t.string   "paypal_id"
    t.decimal  "total",            precision: 8, scale: 2
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "shopping_cart_id"
  end

  add_index "my_payments", ["shopping_cart_id"], name: "index_my_payments_on_shopping_cart_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "pricing"
    t.text     "description"
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "category_id"
    t.integer  "subcategory_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["subcategory_id"], name: "index_products_on_subcategory_id"
  add_index "products", ["user_id"], name: "index_products_on_user_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "name"
    t.string   "last_name"
    t.string   "birth_date"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.string   "status"
    t.string   "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "permission_level",       default: 1
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
