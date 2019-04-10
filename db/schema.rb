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

ActiveRecord::Schema.define(version: 20190410201320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_active_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_active_admin_users_on_reset_password_token", unique: true
  end

  create_table "candidates", force: :cascade do |t|
    t.string "full_name"
    t.text "summary"
    t.text "emails", default: [], array: true
    t.text "phone_numbers", default: [], array: true
    t.text "labels", default: [], array: true
    t.text "links", default: [], array: true
    t.text "custom_fields", default: [], array: true
    t.integer "source"
    t.integer "company_id"
    t.integer "avatar_id"
    t.integer "cv_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["avatar_id"], name: "index_candidates_on_avatar_id"
    t.index ["company_id"], name: "index_candidates_on_company_id"
    t.index ["cv_id"], name: "index_candidates_on_cv_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "unique_name"
    t.string "carrier_site"
    t.integer "company_owner_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.string "timezone_name"
    t.string "timezone_offset"
    t.integer "language"
    t.index ["company_owner_id"], name: "index_companies_on_company_owner_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "filename"
    t.string "s3_path"
    t.integer "size"
    t.string "mimetype"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
  end

  create_table "user_companies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["company_id"], name: "index_user_companies_on_company_id"
    t.index ["user_id"], name: "index_user_companies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.integer "avatar_id"
    t.string "phone_number"
    t.boolean "status"
    t.integer "role"
    t.integer "language"
    t.string "timezone_name"
    t.string "timezone_offset"
    t.string "password_digest"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.string "reset_password_token"
    t.datetime "last_active_at"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.string "invitation_token"
    t.datetime "invitation_confirmed_at"
    t.index ["avatar_id"], name: "index_users_on_avatar_id"
  end

end
