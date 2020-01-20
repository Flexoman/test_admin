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

ActiveRecord::Schema.define(version: 20200112134937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_settings", force: :cascade do |t|
    t.integer "user_id"
    t.text "mail_signature"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["user_id"], name: "index_account_settings_on_user_id"
  end

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

  create_table "application_custom_fields", force: :cascade do |t|
    t.string "name"
    t.integer "field_type"
    t.json "select_options"
    t.integer "input_size"
    t.integer "status"
    t.integer "application_form_id"
    t.integer "job_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.integer "sort_index", default: 0
    t.index ["application_form_id"], name: "index_application_custom_fields_on_application_form_id"
    t.index ["job_id"], name: "index_application_custom_fields_on_job_id"
  end

  create_table "application_forms", force: :cascade do |t|
    t.json "settings"
    t.string "title"
    t.integer "destination"
    t.integer "company_id"
    t.integer "job_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["company_id"], name: "index_application_forms_on_company_id"
    t.index ["job_id"], name: "index_application_forms_on_job_id"
  end

  create_table "applying_custom_answers", force: :cascade do |t|
    t.integer "applying_id"
    t.integer "application_form_id"
    t.integer "application_custom_field_id"
    t.integer "field_type"
    t.json "anwer_body"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["application_custom_field_id"], name: "index_applying_custom_answers_on_application_custom_field_id"
    t.index ["application_form_id"], name: "index_applying_custom_answers_on_application_form_id"
    t.index ["applying_id"], name: "index_applying_custom_answers_on_applying_id"
  end

  create_table "applyings", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "phone_number"
    t.text "cover_letter"
    t.string "linkedin", default: [], array: true
    t.integer "cv_id"
    t.integer "candidate_id"
    t.integer "application_form_id"
    t.integer "job_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["application_form_id"], name: "index_applyings_on_application_form_id"
    t.index ["candidate_id"], name: "index_applyings_on_candidate_id"
    t.index ["cv_id"], name: "index_applyings_on_cv_id"
    t.index ["job_id"], name: "index_applyings_on_job_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.integer "job_id"
    t.integer "candidate_id"
    t.integer "file_id"
    t.text "link"
    t.boolean "is_pinned", default: false
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.integer "visibility"
    t.string "member_ids", array: true
    t.index ["candidate_id"], name: "index_attachments_on_candidate_id"
    t.index ["file_id"], name: "index_attachments_on_file_id"
    t.index ["job_id"], name: "index_attachments_on_job_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "full_name"
    t.text "cover_letter"
    t.text "emails", default: [], array: true
    t.text "phone_numbers", default: [], array: true
    t.text "labels", default: [], array: true
    t.text "links", default: [], array: true
    t.text "custom_fields", default: [], array: true
    t.integer "company_id"
    t.integer "avatar_id"
    t.integer "cv_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.integer "candidate_origin"
    t.boolean "is_new", default: true
    t.datetime "gdpr_expiration_period_set_at"
    t.index ["avatar_id"], name: "index_candidates_on_avatar_id"
    t.index ["company_id"], name: "index_candidates_on_company_id"
    t.index ["cv_id"], name: "index_candidates_on_cv_id"
    t.index ["gdpr_expiration_period_set_at"], name: "index_candidates_on_gdpr_expiration_period_set_at"
  end

  create_table "career_site_appearances", force: :cascade do |t|
    t.integer "career_site_id"
    t.integer "logo_id"
    t.integer "favicon_id"
    t.string "brand_color"
    t.string "font"
    t.text "custom_css"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["career_site_id"], name: "index_career_site_appearances_on_career_site_id"
    t.index ["favicon_id"], name: "index_career_site_appearances_on_favicon_id"
    t.index ["logo_id"], name: "index_career_site_appearances_on_logo_id"
  end

  create_table "career_site_sections", force: :cascade do |t|
    t.integer "career_site_id"
    t.string "header_heading"
    t.text "header_subheading"
    t.integer "header_background_image_id"
    t.string "about_us_heading"
    t.text "about_us_subheading"
    t.integer "about_us_background_image_id"
    t.string "jobs_heading"
    t.text "jobs_subheading"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["about_us_background_image_id"], name: "index_career_site_sections_on_about_us_background_image_id"
    t.index ["career_site_id"], name: "index_career_site_sections_on_career_site_id"
    t.index ["header_background_image_id"], name: "index_career_site_sections_on_header_background_image_id"
  end

  create_table "career_sites", force: :cascade do |t|
    t.integer "company_id"
    t.boolean "is_online"
    t.string "website_address"
    t.string "custom_domain"
    t.string "main_website_link"
    t.string "ga_uid"
    t.boolean "seo_indexing"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.string "seo_title"
    t.text "seo_description"
    t.integer "language"
    t.string "website_history_addresses", array: true
    t.string "linkedin_link"
    t.string "facebook_link"
    t.string "instagram_link"
    t.string "twitter_link"
    t.string "youtube_link"
    t.index ["company_id"], name: "index_career_sites_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "unique_name"
    t.integer "company_owner_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.string "timezone_name"
    t.string "timezone_offset"
    t.integer "language"
    t.integer "compliance_status"
    t.integer "expiration_period"
    t.datetime "expiration_period_updated_at"
    t.text "application_confirmation_email_body"
    t.integer "data_protection_user_id"
    t.index ["company_owner_id"], name: "index_companies_on_company_owner_id"
    t.index ["data_protection_user_id"], name: "index_companies_on_data_protection_user_id"
  end

  create_table "db_admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_db_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_db_admin_users_on_reset_password_token", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.integer "sort_index", default: 0
    t.integer "company_id"
    t.index ["company_id"], name: "index_departments_on_company_id"
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
    t.string "linkable_type"
    t.bigint "linkable_id"
    t.index ["linkable_type", "linkable_id"], name: "index_documents_on_linkable_type_and_linkable_id"
  end

  create_table "evaluation_answers", force: :cascade do |t|
    t.integer "evaluation_id"
    t.integer "evaluation_form_id"
    t.integer "evaluation_question_id"
    t.integer "sort_index", default: 0
    t.integer "rating"
    t.integer "field_type"
    t.json "answer_body"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["evaluation_form_id"], name: "index_evaluation_answers_on_evaluation_form_id"
    t.index ["evaluation_id"], name: "index_evaluation_answers_on_evaluation_id"
    t.index ["evaluation_question_id"], name: "index_evaluation_answers_on_evaluation_question_id"
  end

  create_table "evaluation_forms", force: :cascade do |t|
    t.json "settings"
    t.string "title"
    t.integer "destination"
    t.integer "company_id"
    t.integer "job_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["company_id"], name: "index_evaluation_forms_on_company_id"
    t.index ["job_id"], name: "index_evaluation_forms_on_job_id"
  end

  create_table "evaluation_questions", force: :cascade do |t|
    t.string "title"
    t.integer "field_type"
    t.json "select_options"
    t.integer "input_size"
    t.integer "sort_index", default: 0
    t.integer "evaluation_form_id"
    t.integer "job_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["evaluation_form_id"], name: "index_evaluation_questions_on_evaluation_form_id"
    t.index ["job_id"], name: "index_evaluation_questions_on_job_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "evaluation_form_id"
    t.integer "pipeline_stage_id"
    t.integer "job_id"
    t.text "summary"
    t.integer "rating"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["candidate_id"], name: "index_evaluations_on_candidate_id"
    t.index ["evaluation_form_id"], name: "index_evaluations_on_evaluation_form_id"
    t.index ["job_id"], name: "index_evaluations_on_job_id"
    t.index ["pipeline_stage_id"], name: "index_evaluations_on_pipeline_stage_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.integer "event_type", default: 0
    t.integer "candidate_id"
    t.string "member_ids", default: [], array: true
    t.date "event_date"
    t.string "start_time"
    t.string "end_time"
    t.string "time_zone"
    t.string "location"
    t.text "note"
    t.integer "job_id"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "job_id"
    t.boolean "is_system"
    t.integer "sort_index", default: 0
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["job_id"], name: "index_job_users_on_job_id"
    t.index ["user_id"], name: "index_job_users_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.integer "department_id"
    t.integer "company_id"
    t.integer "status"
    t.integer "employment_type"
    t.string "location"
    t.text "description", default: ""
    t.boolean "is_remote", default: false
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.integer "sort_index", default: 0
    t.string "seo_title"
    t.text "seo_description"
    t.string "slag"
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["department_id"], name: "index_jobs_on_department_id"
  end

  create_table "mail_accounts", force: :cascade do |t|
    t.string "name"
    t.integer "acc_type"
    t.boolean "is_active"
    t.string "smtp_setting_mongo_uid"
    t.string "imap_setting_mongo_uid"
    t.integer "user_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.string "access_token"
    t.string "refresh_token"
    t.string "email"
    t.index ["user_id"], name: "index_mail_accounts_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "body"
    t.integer "job_id"
    t.integer "candidate_id"
    t.boolean "is_pinned"
    t.integer "visibility"
    t.string "member_ids", array: true
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["candidate_id"], name: "index_notes_on_candidate_id"
    t.index ["job_id"], name: "index_notes_on_job_id"
  end

  create_table "pipeline_stage_candidates", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "pipeline_stage_id"
    t.integer "job_id"
    t.integer "sort_index", default: 0
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["candidate_id", "pipeline_stage_id"], name: "pipeline_stage_candidate_candidates_index", unique: true
  end

  create_table "pipeline_stages", force: :cascade do |t|
    t.string "title"
    t.integer "stage_type"
    t.string "color", default: "#c4c5d6"
    t.integer "sort_index", default: 0
    t.integer "job_id"
    t.boolean "is_default"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.integer "destination"
    t.integer "company_id"
    t.index ["job_id"], name: "index_pipeline_stages_on_job_id"
  end

  create_table "reason_associations", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "job_id"
    t.integer "reason_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["candidate_id"], name: "index_reason_associations_on_candidate_id"
    t.index ["job_id"], name: "index_reason_associations_on_job_id"
    t.index ["reason_id"], name: "index_reason_associations_on_reason_id"
  end

  create_table "reasons", force: :cascade do |t|
    t.integer "kind"
    t.string "name"
    t.integer "sort_index", default: 0
    t.integer "company_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["company_id"], name: "index_reasons_on_company_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.integer "sort_index", default: 0
    t.integer "company_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["company_id"], name: "index_sources_on_company_id"
  end

  create_table "star_associations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "job_id"
    t.integer "candidate_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["candidate_id"], name: "index_star_associations_on_candidate_id"
    t.index ["job_id"], name: "index_star_associations_on_job_id"
    t.index ["user_id"], name: "index_star_associations_on_user_id"
  end

  create_table "tag_associations", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "job_id"
    t.integer "company_id"
    t.integer "tag_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["candidate_id"], name: "index_tag_associations_on_candidate_id"
    t.index ["company_id"], name: "index_tag_associations_on_company_id"
    t.index ["job_id"], name: "index_tag_associations_on_job_id"
    t.index ["tag_id"], name: "index_tag_associations_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "company_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by"
    t.datetime "archived_at", precision: 6
    t.integer "archived_by"
    t.index ["company_id"], name: "index_tags_on_company_id"
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
