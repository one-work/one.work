# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_08_26_044623) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "action_mailbox_inbound_emails", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "status", null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "record_type"
    t.uuid "record_id"
    t.text "body"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
    t.index ["record_type", "record_id"], name: "index_action_text_rich_texts_on_record"
  end

  create_table "active_storage_attachments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "record_type"
    t.uuid "record_id"
    t.uuid "blob_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id"], name: "index_active_storage_attachments_on_record"
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.jsonb "metadata"
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.integer "byte_size", null: false
    t.string "checksum"
    t.string "service_name", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "blob_id"
    t.string "variation_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blob_id"], name: "index_active_storage_variant_records_on_blob_id"
  end

  create_table "alipay_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "type"
    t.string "name"
    t.string "appid"
    t.string "private_rsa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_alipay_apps_on_organ_id"
  end

  create_table "attend_absence_stats", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.string "year"
    t.float "annual_days"
    t.float "annual_add"
    t.float "left_annual_days"
    t.float "vacation_days"
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_attend_absence_stats_on_member_id"
  end

  create_table "attend_absences", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "merged_id"
    t.string "type"
    t.string "state"
    t.float "hours"
    t.string "kind"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string "note"
    t.string "comment"
    t.boolean "redeeming"
    t.jsonb "redeeming_days"
    t.boolean "processed"
    t.boolean "divided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_attend_absences_on_member_id"
    t.index ["merged_id"], name: "index_attend_absences_on_merged_id"
  end

  create_table "attend_attendance_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "attendance_id"
    t.string "source"
    t.string "state"
    t.string "name"
    t.datetime "record_at"
    t.boolean "processed"
    t.string "kind"
    t.string "note"
    t.string "record_at_str"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendance_id"], name: "index_attend_attendance_logs_on_attendance_id"
    t.index ["member_id"], name: "index_attend_attendance_logs_on_member_id"
  end

  create_table "attend_attendance_settings", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.date "effect_on"
    t.date "expire_on"
    t.string "on_time"
    t.string "off_time"
    t.string "note"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_attend_attendance_settings_on_member_id"
  end

  create_table "attend_attendance_stats", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "financial_month_id"
    t.string "costed_absence"
    t.string "redeeming_absence"
    t.string "free_absence"
    t.integer "allowance_days"
    t.integer "late_days"
    t.float "absence_redeeming_hours"
    t.float "cost_absence_hours"
    t.float "holiday_redeeming_hours"
    t.boolean "processed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["financial_month_id"], name: "index_attend_attendance_stats_on_financial_month_id"
    t.index ["member_id"], name: "index_attend_attendance_stats_on_member_id"
  end

  create_table "attend_attendances", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "interval_absence_id"
    t.uuid "late_absence_id"
    t.uuid "leave_absence_id"
    t.integer "late_minutes"
    t.integer "leave_minutes"
    t.float "overtime_hours"
    t.float "attend_hours"
    t.float "interval_hours"
    t.float "total_hours"
    t.date "attend_on"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.datetime "interval_start_at"
    t.datetime "interval_finish_at"
    t.string "kind"
    t.integer "absence_minutes"
    t.boolean "absence_redeeming"
    t.jsonb "lost_logs"
    t.boolean "workday"
    t.boolean "processed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interval_absence_id"], name: "index_attend_attendances_on_interval_absence_id"
    t.index ["late_absence_id"], name: "index_attend_attendances_on_late_absence_id"
    t.index ["leave_absence_id"], name: "index_attend_attendances_on_leave_absence_id"
    t.index ["member_id"], name: "index_attend_attendances_on_member_id"
  end

  create_table "attend_extra_days", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.date "the_day"
    t.string "name"
    t.string "kind"
    t.string "scope"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_attend_extra_days_on_organ_id"
  end

  create_table "attend_financial_months", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.date "begin_date"
    t.date "end_date"
    t.string "working_days"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_attend_financial_months_on_organ_id"
  end

  create_table "attend_overtimes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string "note"
    t.string "comment"
    t.float "hours"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_attend_overtimes_on_member_id"
  end

  create_table "auditor_approvals", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "approving_type"
    t.uuid "approving_id"
    t.string "operator_type"
    t.uuid "operator_id"
    t.boolean "approved"
    t.jsonb "pending_changes"
    t.jsonb "related_changes"
    t.string "comment"
    t.datetime "approved_at"
    t.integer "unapproved_approvals_count"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approving_type", "approving_id"], name: "index_auditor_approvals_on_approving"
    t.index ["operator_type", "operator_id"], name: "index_auditor_approvals_on_operator"
  end

  create_table "auditor_audits", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "audited_type"
    t.uuid "audited_id"
    t.string "operator_type"
    t.uuid "operator_id"
    t.string "type"
    t.string "action"
    t.jsonb "audited_changes"
    t.jsonb "related_changes"
    t.jsonb "extra"
    t.string "note"
    t.string "remote_ip"
    t.string "controller_path"
    t.string "action_name"
    t.datetime "created_at", null: false
    t.index ["audited_type", "audited_id"], name: "index_auditor_audits_on_audited"
    t.index ["created_at"], name: "index_auditor_audits_on_created_at"
    t.index ["operator_type", "operator_id"], name: "index_auditor_audits_on_operator"
  end

  create_table "auditor_verifications", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "job_title_id"
    t.string "verified_type"
    t.uuid "verified_id"
    t.uuid "verifier_id"
    t.string "state"
    t.string "note"
    t.integer "position"
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_title_id"], name: "index_auditor_verifications_on_job_title_id"
    t.index ["member_id"], name: "index_auditor_verifications_on_member_id"
    t.index ["verified_type", "verified_id"], name: "index_auditor_verifications_on_verified"
    t.index ["verifier_id"], name: "index_auditor_verifications_on_verifier_id"
  end

  create_table "auditor_verifiers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "job_title_id"
    t.string "verifiable_type"
    t.uuid "verifiable_id"
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_title_id"], name: "index_auditor_verifiers_on_job_title_id"
    t.index ["member_id"], name: "index_auditor_verifiers_on_member_id"
    t.index ["verifiable_type", "verifiable_id"], name: "index_auditor_verifiers_on_verifiable"
  end

  create_table "auth_accounts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "identity"
    t.boolean "confirmed"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identity", "confirmed"], name: "index_auth_accounts_on_identity_and_confirmed"
    t.index ["identity"], name: "index_auth_accounts_on_identity"
    t.index ["user_id"], name: "index_auth_accounts_on_user_id"
  end

  create_table "auth_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.string "key"
    t.string "host"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_auth_apps_on_appid"
  end

  create_table "auth_oauth_users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "organ_id"
    t.string "provider"
    t.string "session_key"
    t.string "remark"
    t.string "name"
    t.string "avatar_url"
    t.string "appid"
    t.string "app_name"
    t.string "scene_tag"
    t.string "uid"
    t.string "unionid"
    t.string "access_token"
    t.datetime "expires_at"
    t.string "refresh_token"
    t.boolean "agency_oauth"
    t.datetime "unsubscribe_at"
    t.string "scope"
    t.string "type"
    t.string "state"
    t.jsonb "extra"
    t.string "identity"
    t.datetime "online_at"
    t.datetime "offline_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identity"], name: "index_auth_oauth_users_on_identity"
    t.index ["organ_id"], name: "index_auth_oauth_users_on_organ_id"
    t.index ["uid", "type"], name: "index_auth_oauth_users_on_uid_and_type", unique: true
    t.index ["unionid"], name: "index_auth_oauth_users_on_unionid"
    t.index ["user_id"], name: "index_auth_oauth_users_on_user_id"
  end

  create_table "auth_sessions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "member_id"
    t.string "identity"
    t.datetime "expires_at"
    t.integer "access_counter"
    t.boolean "mock_user"
    t.string "business"
    t.string "uid"
    t.string "session_id"
    t.datetime "online_at"
    t.datetime "offline_at"
    t.string "encrypted_token"
    t.string "auth_appid"
    t.string "suite_id"
    t.string "corp_userid"
    t.string "appid"
    t.boolean "mock_member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.index ["identity"], name: "index_auth_sessions_on_identity"
    t.index ["member_id"], name: "index_auth_sessions_on_member_id"
    t.index ["user_id"], name: "index_auth_sessions_on_user_id"
  end

  create_table "auth_user_taggeds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "user_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_auth_user_taggeds_on_user_id"
    t.index ["user_tag_id"], name: "index_auth_user_taggeds_on_user_tag_id"
  end

  create_table "auth_user_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "user_tagging_type"
    t.uuid "user_tagging_id"
    t.string "name"
    t.integer "user_taggeds_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_auth_user_tags_on_organ_id"
    t.index ["user_tagging_type", "user_tagging_id"], name: "index_auth_user_tags_on_user_tagging"
  end

  create_table "auth_users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "cache_id"
    t.string "name"
    t.string "password_digest"
    t.string "locale"
    t.string "timezone"
    t.datetime "last_login_at"
    t.string "last_login_ip"
    t.boolean "disabled"
    t.string "source"
    t.string "invited_code"
    t.boolean "admin"
    t.string "notifiable_types"
    t.jsonb "counters"
    t.integer "showtime"
    t.boolean "accept_email"
    t.integer "promote_goods_count"
    t.integer "pomodoro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cache_id"], name: "index_auth_users_on_cache_id"
  end

  create_table "auth_verify_tokens", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "type"
    t.string "token"
    t.datetime "expires_at"
    t.string "identity"
    t.integer "access_counter"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identity"], name: "index_auth_verify_tokens_on_identity"
  end

  create_table "bench_facilitate_indicators", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "facilitate_id"
    t.uuid "facilitate_taxon_id"
    t.uuid "indicator_id"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_facilitate_indicators_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_bench_facilitate_indicators_on_facilitate_taxon_id"
    t.index ["indicator_id"], name: "index_bench_facilitate_indicators_on_indicator_id"
  end

  create_table "bench_facilitate_providers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "facilitate_id"
    t.uuid "provider_id"
    t.string "note"
    t.boolean "selected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_facilitate_providers_on_facilitate_id"
    t.index ["provider_id"], name: "index_bench_facilitate_providers_on_provider_id"
  end

  create_table "bench_facilitate_taxon_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "bench/facilitate_taxon_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_bench_facilitate_taxon_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_bench_facilitate_taxon_hierarchies_on_descendant_id"
  end

  create_table "bench_facilitate_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.uuid "organ_id"
    t.uuid "taxon_id"
    t.jsonb "parent_ancestors"
    t.string "name"
    t.string "color"
    t.string "description"
    t.integer "position"
    t.integer "facilitates_count"
    t.integer "indicators_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bench_facilitate_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_bench_facilitate_taxons_on_parent_id"
    t.index ["taxon_id"], name: "index_bench_facilitate_taxons_on_taxon_id"
  end

  create_table "bench_facilitates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "standard_id"
    t.uuid "facilitate_taxon_id"
    t.string "name"
    t.decimal "quantity"
    t.decimal "unified_quantity"
    t.string "unit"
    t.string "description"
    t.string "qr_prefix"
    t.boolean "published"
    t.string "sku"
    t.decimal "price"
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.jsonb "wallet_price"
    t.jsonb "extra"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.string "good_type"
    t.decimal "step", comment: "Item Number Step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_taxon_id"], name: "index_bench_facilitates_on_facilitate_taxon_id"
    t.index ["organ_id"], name: "index_bench_facilitates_on_organ_id"
    t.index ["standard_id"], name: "index_bench_facilitates_on_standard_id"
  end

  create_table "bench_facilitatings", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "facilitate_id"
    t.uuid "facilitator_id"
    t.uuid "member_id"
    t.uuid "wallet_payment_id"
    t.uuid "item_id"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.datetime "estimate_finish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "extra"
    t.uuid "user_id"
    t.string "name"
    t.string "sku"
    t.decimal "price"
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.jsonb "wallet_price"
    t.string "unit"
    t.decimal "quantity"
    t.decimal "unified_quantity"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.string "good_type"
    t.decimal "step", comment: "Item Number Step"
    t.index ["facilitate_id"], name: "index_bench_facilitatings_on_facilitate_id"
    t.index ["facilitator_id"], name: "index_bench_facilitatings_on_facilitator_id"
    t.index ["item_id"], name: "index_bench_facilitatings_on_item_id"
    t.index ["member_id"], name: "index_bench_facilitatings_on_member_id"
    t.index ["user_id"], name: "index_bench_facilitatings_on_user_id"
    t.index ["wallet_payment_id"], name: "index_bench_facilitatings_on_wallet_payment_id"
  end

  create_table "bench_facilitators", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "facilitate_id"
    t.uuid "member_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_facilitators_on_facilitate_id"
    t.index ["member_id"], name: "index_bench_facilitators_on_member_id"
  end

  create_table "bench_indicators", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "unit"
    t.decimal "reference_min"
    t.decimal "reference_max"
    t.string "target_source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bench_mileposts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.integer "position"
    t.integer "project_mileposts_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bench_mileposts_on_organ_id"
  end

  create_table "bench_project_facilitates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "project_id"
    t.uuid "facilitate_taxon_id"
    t.uuid "facilitate_id"
    t.uuid "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_project_facilitates_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_bench_project_facilitates_on_facilitate_taxon_id"
    t.index ["project_id"], name: "index_bench_project_facilitates_on_project_id"
    t.index ["provider_id"], name: "index_bench_project_facilitates_on_provider_id"
  end

  create_table "bench_project_indicators", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "project_id"
    t.uuid "indicator_id"
    t.date "recorded_on"
    t.datetime "recorded_at"
    t.string "value"
    t.string "source"
    t.string "comment"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["indicator_id"], name: "index_bench_project_indicators_on_indicator_id"
    t.index ["project_id"], name: "index_bench_project_indicators_on_project_id"
  end

  create_table "bench_project_mileposts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "project_id"
    t.uuid "milepost_id"
    t.date "recorded_on"
    t.boolean "current"
    t.string "milepost_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["milepost_id"], name: "index_bench_project_mileposts_on_milepost_id"
    t.index ["project_id"], name: "index_bench_project_mileposts_on_project_id"
  end

  create_table "bench_project_stages", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.date "begin_on"
    t.date "end_on"
    t.string "note"
    t.integer "projects_count"
    t.decimal "fund_budget"
    t.decimal "fund_expense"
    t.decimal "budget_amount"
    t.decimal "expense_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bench_project_webhooks", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "project_id"
    t.jsonb "origin_data"
    t.jsonb "valuable_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_bench_project_webhooks_on_project_id"
  end

  create_table "bench_projects", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "taxon_id"
    t.string "name"
    t.string "description"
    t.string "state"
    t.jsonb "extra"
    t.decimal "fund_budget"
    t.decimal "fund_expense"
    t.decimal "budget_amount"
    t.decimal "expense_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bench_projects_on_organ_id"
    t.index ["taxon_id"], name: "index_bench_projects_on_taxon_id"
  end

  create_table "bench_standard_providers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "facilitate_id"
    t.boolean "selected"
    t.string "note"
    t.decimal "export_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_standard_providers_on_facilitate_id"
  end

  create_table "bench_standards", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bench_task_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "bench/task_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_bench_task_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_bench_task_hierarchies_on_descendant_id"
  end

  create_table "bench_task_template_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "bench/task_template_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_bench_task_template_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_bench_task_template_hierarchies_on_descendant_id"
  end

  create_table "bench_task_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.uuid "taxon_id"
    t.uuid "organ_id"
    t.uuid "department_id"
    t.uuid "job_title_id"
    t.uuid "member_id"
    t.jsonb "parent_ancestors"
    t.string "title"
    t.integer "position"
    t.string "color"
    t.string "repeat_type"
    t.jsonb "repeat_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_bench_task_templates_on_department_id"
    t.index ["job_title_id"], name: "index_bench_task_templates_on_job_title_id"
    t.index ["member_id"], name: "index_bench_task_templates_on_member_id"
    t.index ["organ_id"], name: "index_bench_task_templates_on_organ_id"
    t.index ["parent_id"], name: "index_bench_task_templates_on_parent_id"
    t.index ["taxon_id"], name: "index_bench_task_templates_on_taxon_id"
  end

  create_table "bench_task_timers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "task_id"
    t.integer "duration"
    t.datetime "finish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_bench_task_timers_on_task_id"
  end

  create_table "bench_tasks", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "organ_id"
    t.uuid "department_id"
    t.uuid "job_title_id"
    t.uuid "member_id"
    t.uuid "project_id"
    t.uuid "task_template_id"
    t.uuid "parent_id"
    t.string "title"
    t.integer "position"
    t.string "note"
    t.integer "estimated_time"
    t.integer "actual_time"
    t.datetime "done_at"
    t.integer "children_count"
    t.datetime "start_at"
    t.string "serial_number", comment: "Task Template test repeat"
    t.decimal "cost_fund"
    t.integer "cost_stock"
    t.date "deadline_on"
    t.string "state"
    t.string "focus"
    t.jsonb "parent_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_bench_tasks_on_department_id"
    t.index ["job_title_id"], name: "index_bench_tasks_on_job_title_id"
    t.index ["member_id"], name: "index_bench_tasks_on_member_id"
    t.index ["organ_id"], name: "index_bench_tasks_on_organ_id"
    t.index ["parent_id"], name: "index_bench_tasks_on_parent_id"
    t.index ["project_id"], name: "index_bench_tasks_on_project_id"
    t.index ["task_template_id"], name: "index_bench_tasks_on_task_template_id"
    t.index ["user_id"], name: "index_bench_tasks_on_user_id"
  end

  create_table "bench_taxon_facilitates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "taxon_id"
    t.uuid "facilitate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_taxon_facilitates_on_facilitate_id"
    t.index ["taxon_id"], name: "index_bench_taxon_facilitates_on_taxon_id"
  end

  create_table "bench_taxon_indicators", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "taxon_id"
    t.uuid "indicator_id"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["indicator_id"], name: "index_bench_taxon_indicators_on_indicator_id"
    t.index ["taxon_id"], name: "index_bench_taxon_indicators_on_taxon_id"
  end

  create_table "bench_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "record_name"
    t.string "name"
    t.integer "projects_count"
    t.jsonb "parameters"
    t.decimal "fund_budget"
    t.decimal "fund_expense"
    t.decimal "budget_amount"
    t.decimal "expense_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bluetooth_devices", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bluetooth_devices_on_organ_id"
  end

  create_table "bluetooth_errs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bluetooth_errs_on_organ_id"
  end

  create_table "cms_audio_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "audio_id"
    t.uuid "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audio_id"], name: "index_cms_audio_tags_on_audio_id"
    t.index ["tag_id"], name: "index_cms_audio_tags_on_tag_id"
  end

  create_table "cms_audios", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "author_id"
    t.uuid "organ_id"
    t.string "title"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_cms_audios_on_author_id"
    t.index ["organ_id"], name: "index_cms_audios_on_organ_id"
  end

  create_table "cms_carousels", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "title"
    t.integer "position"
    t.string "link"
    t.boolean "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_cms_carousels_on_organ_id"
  end

  create_table "cms_covers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_cms_covers_on_organ_id"
  end

  create_table "cms_progressions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "progressive_type"
    t.uuid "progressive_id"
    t.decimal "ratio", comment: "完成比例"
    t.decimal "time"
    t.decimal "duration"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["progressive_type", "progressive_id"], name: "index_cms_progressions_on_progressive"
    t.index ["user_id"], name: "index_cms_progressions_on_user_id"
  end

  create_table "cms_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cms_videos", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "author_id"
    t.uuid "organ_id"
    t.uuid "video_taxon_id"
    t.string "title"
    t.integer "share_count"
    t.integer "view_count"
    t.integer "liked_count"
    t.integer "comments_count"
    t.string "water_mark_job"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_cms_videos_on_author_id"
    t.index ["organ_id"], name: "index_cms_videos_on_organ_id"
    t.index ["video_taxon_id"], name: "index_cms_videos_on_video_taxon_id"
  end

  create_table "com_acme_accounts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "email"
    t.string "kid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_acme_domains", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "acme_servicer_id"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acme_servicer_id"], name: "index_com_acme_domains_on_acme_servicer_id"
  end

  create_table "com_acme_identifiers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "acme_order_id"
    t.string "type"
    t.string "identifier"
    t.string "file_name"
    t.string "file_content"
    t.string "token"
    t.string "record_name"
    t.string "record_content"
    t.string "domain"
    t.string "domain_root"
    t.boolean "wildcard"
    t.string "url"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acme_order_id"], name: "index_com_acme_identifiers_on_acme_order_id"
  end

  create_table "com_acme_orders", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "acme_account_id"
    t.string "orderid"
    t.string "url"
    t.datetime "issued_at"
    t.datetime "expire_at", comment: "过期时间"
    t.string "identifiers", array: true
    t.string "sync_host"
    t.string "sync_path"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acme_account_id"], name: "index_com_acme_orders_on_acme_account_id"
  end

  create_table "com_acme_servicers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "type"
    t.string "key"
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_blob_defaults", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "record_class", comment: "AR 类名，如 User"
    t.string "name", comment: "名称, attach 名称，如：avatar"
    t.string "macro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_blob_pdfs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_blob_temps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_cache_lists", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "path"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_csps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "document_uri"
    t.string "referrer"
    t.string "violated_directive"
    t.string "effective_directive"
    t.string "original_policy"
    t.string "disposition"
    t.string "blocked_uri"
    t.string "line_number"
    t.string "column_number"
    t.string "source_file"
    t.string "status_code"
    t.string "script_sample"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_detector_bots", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "detector_id"
    t.string "type"
    t.string "hook_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detector_id"], name: "index_com_detector_bots_on_detector_id"
  end

  create_table "com_detector_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "detector_id"
    t.string "error"
    t.string "type"
    t.string "status"
    t.string "body"
    t.datetime "started_at"
    t.integer "spend", comment: "单位为毫秒"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detector_id"], name: "index_com_detector_logs_on_detector_id"
  end

  create_table "com_detectors", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_err_bots", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "base_url"
    t.string "type"
    t.string "hook_key"
    t.string "hook_url"
    t.boolean "first_time"
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_err_notices", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "err_bot_id"
    t.string "controller_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name"], name: "index_com_err_notices_on_controller_name"
    t.index ["err_bot_id"], name: "index_com_err_notices_on_err_bot_id"
  end

  create_table "com_err_summaries", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "controller_name"
    t.string "action_name"
    t.string "exception_object"
    t.integer "errs_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_errs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "path"
    t.string "controller_name"
    t.string "action_name"
    t.string "exception"
    t.string "exception_object"
    t.string "exception_backtrace", array: true
    t.jsonb "params"
    t.jsonb "headers"
    t.jsonb "cookie"
    t.jsonb "session"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_filter_columns", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "filter_id"
    t.string "column"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filter_id"], name: "index_com_filter_columns_on_filter_id"
  end

  create_table "com_filters", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "controller_path", null: false
    t.string "action_name"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_path", "action_name"], name: "index_com_filters_on_controller_path_and_action_name"
    t.index ["organ_id"], name: "index_com_filters_on_organ_id"
  end

  create_table "com_infos", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.string "value"
    t.string "version"
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_meta_actions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "namespace_identifier", null: false
    t.string "business_identifier", null: false
    t.string "controller_path", null: false
    t.string "controller_name", null: false
    t.string "action_name"
    t.string "path"
    t.string "verb"
    t.integer "position"
    t.boolean "landmark"
    t.datetime "synced_at"
    t.string "required_parts", array: true
    t.string "operation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_identifier"], name: "index_com_meta_actions_on_business_identifier"
    t.index ["controller_path"], name: "index_com_meta_actions_on_controller_path"
    t.index ["namespace_identifier"], name: "index_com_meta_actions_on_namespace_identifier"
  end

  create_table "com_meta_businesses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "identifier", null: false
    t.integer "position"
    t.datetime "synced_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_com_meta_businesses_on_identifier"
  end

  create_table "com_meta_columns", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "record_name"
    t.string "column_name"
    t.string "sql_type"
    t.string "column_type"
    t.integer "column_limit"
    t.string "comment"
    t.boolean "defined_db"
    t.boolean "defined_model"
    t.boolean "belongs_enable"
    t.string "belongs_table"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_name"], name: "index_com_meta_columns_on_record_name"
  end

  create_table "com_meta_controllers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "namespace_identifier", null: false
    t.string "business_identifier", null: false
    t.string "controller_path", null: false
    t.string "controller_name", null: false
    t.datetime "synced_at"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_identifier"], name: "index_com_meta_controllers_on_business_identifier"
    t.index ["controller_path"], name: "index_com_meta_controllers_on_controller_path"
    t.index ["namespace_identifier"], name: "index_com_meta_controllers_on_namespace_identifier"
  end

  create_table "com_meta_models", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "record_name"
    t.string "table_name"
    t.string "description"
    t.boolean "defined_db"
    t.boolean "customizable", comment: "是否允许用户定制"
    t.string "business_identifier", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_identifier"], name: "index_com_meta_models_on_business_identifier"
    t.index ["record_name"], name: "index_com_meta_models_on_record_name"
  end

  create_table "com_meta_namespaces", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "identifier", null: false
    t.boolean "verify_organ"
    t.boolean "verify_member"
    t.boolean "verify_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_com_meta_namespaces_on_identifier"
  end

  create_table "com_meta_operations", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "action_name"
    t.string "operation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_ssh_keys", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "host"
    t.string "ssh_user"
    t.string "private_key"
    t.string "public_key"
    t.string "fingerprint"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_com_ssh_keys_on_user_id"
  end

  create_table "com_state_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "com/state_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_com_state_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_com_state_hierarchies_on_descendant_id"
  end

  create_table "com_states", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "organ_id"
    t.uuid "parent_id"
    t.string "host"
    t.string "path"
    t.string "controller_path"
    t.string "action_name"
    t.string "request_method"
    t.string "referer"
    t.jsonb "params"
    t.jsonb "body"
    t.jsonb "cookie"
    t.string "session_id"
    t.jsonb "session"
    t.boolean "destroyable"
    t.string "auth_token"
    t.jsonb "parent_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_com_states_on_organ_id"
    t.index ["user_id"], name: "index_com_states_on_user_id"
  end

  create_table "crm_agencies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "agent_type"
    t.uuid "agent_id"
    t.string "client_type"
    t.uuid "client_id"
    t.string "relation"
    t.decimal "commission_ratio", comment: "交易时抽成比例"
    t.string "note", comment: "备注"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_type", "agent_id"], name: "index_crm_agencies_on_agent"
    t.index ["client_type", "client_id"], name: "index_crm_agencies_on_client"
  end

  create_table "crm_client_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "crm/client_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_crm_client_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_crm_client_hierarchies_on_descendant_id"
  end

  create_table "crm_clients", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.uuid "organ_id"
    t.uuid "client_organ_id"
    t.jsonb "parent_ancestors"
    t.string "name"
    t.jsonb "settings"
    t.integer "wallets_count"
    t.integer "cards_count"
    t.integer "orders_count"
    t.integer "addresses_count"
    t.integer "items_count"
    t.integer "carts_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_organ_id"], name: "index_crm_clients_on_client_organ_id"
    t.index ["organ_id"], name: "index_crm_clients_on_organ_id"
    t.index ["parent_id"], name: "index_crm_clients_on_parent_id"
  end

  create_table "crm_contacts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "client_member_id"
    t.uuid "client_user_id"
    t.uuid "client_id"
    t.string "name"
    t.string "identity"
    t.jsonb "extra"
    t.boolean "default"
    t.integer "wallets_count"
    t.integer "cards_count"
    t.integer "orders_count"
    t.integer "addresses_count"
    t.integer "items_count"
    t.integer "carts_count"
    t.string "corpid"
    t.string "external_userid"
    t.string "position"
    t.string "avatar_url"
    t.string "corp_name"
    t.string "corp_full_name"
    t.string "external_type"
    t.string "unionid"
    t.string "wechat_openid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_crm_contacts_on_client_id"
    t.index ["client_member_id"], name: "index_crm_contacts_on_client_member_id"
    t.index ["client_user_id"], name: "index_crm_contacts_on_client_user_id"
    t.index ["organ_id"], name: "index_crm_contacts_on_organ_id"
    t.index ["unionid"], name: "index_crm_contacts_on_unionid"
    t.index ["wechat_openid"], name: "index_crm_contacts_on_wechat_openid"
  end

  create_table "crm_maintain_sources", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "source_id"
    t.string "name"
    t.integer "maintains_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_crm_maintain_sources_on_organ_id"
    t.index ["source_id"], name: "index_crm_maintain_sources_on_source_id"
  end

  create_table "crm_maintain_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "tag_id"
    t.string "name"
    t.string "logged_type"
    t.string "entity_column"
    t.string "entity_value"
    t.integer "sequence"
    t.boolean "manual"
    t.string "color"
    t.integer "notes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_crm_maintain_tags_on_organ_id"
    t.index ["tag_id"], name: "index_crm_maintain_tags_on_tag_id"
  end

  create_table "crm_maintains", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "member_id"
    t.uuid "task_template_id"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.string "agent_type"
    t.uuid "agent_id"
    t.uuid "agency_id"
    t.uuid "maintain_source_id"
    t.uuid "upstream_id"
    t.uuid "original_id"
    t.string "remark"
    t.integer "position"
    t.string "state"
    t.string "type"
    t.string "description"
    t.string "oper_userid"
    t.string "add_way"
    t.string "external_userid"
    t.string "pending_id"
    t.jsonb "remark_mobiles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_crm_maintains_on_agency_id"
    t.index ["agent_type", "agent_id"], name: "index_crm_maintains_on_agent"
    t.index ["client_id"], name: "index_crm_maintains_on_client_id"
    t.index ["contact_id"], name: "index_crm_maintains_on_contact_id"
    t.index ["maintain_source_id"], name: "index_crm_maintains_on_maintain_source_id"
    t.index ["member_id"], name: "index_crm_maintains_on_member_id"
    t.index ["organ_id"], name: "index_crm_maintains_on_organ_id"
    t.index ["original_id"], name: "index_crm_maintains_on_original_id"
    t.index ["pending_id"], name: "index_crm_maintains_on_pending_id"
    t.index ["task_template_id"], name: "index_crm_maintains_on_task_template_id"
    t.index ["upstream_id"], name: "index_crm_maintains_on_upstream_id"
  end

  create_table "crm_notes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.string "logged_type"
    t.uuid "logged_id"
    t.uuid "maintain_tag_id"
    t.string "content"
    t.string "tag_str"
    t.integer "tag_sequence"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_crm_notes_on_client_id"
    t.index ["contact_id"], name: "index_crm_notes_on_contact_id"
    t.index ["logged_type", "logged_id"], name: "index_crm_notes_on_logged"
    t.index ["maintain_tag_id"], name: "index_crm_notes_on_maintain_tag_id"
    t.index ["member_id"], name: "index_crm_notes_on_member_id"
  end

  create_table "crm_qrcodes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "source_id"
    t.integer "margin_x"
    t.integer "margin_y"
    t.integer "fixed_width"
    t.string "align"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_crm_qrcodes_on_source_id"
  end

  create_table "crm_source_contacts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "maintain_source_id"
    t.uuid "source_id"
    t.uuid "contact_id"
    t.uuid "trade_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_crm_source_contacts_on_contact_id"
    t.index ["maintain_source_id"], name: "index_crm_source_contacts_on_maintain_source_id"
    t.index ["organ_id"], name: "index_crm_source_contacts_on_organ_id"
    t.index ["source_id"], name: "index_crm_source_contacts_on_source_id"
    t.index ["trade_item_id"], name: "index_crm_source_contacts_on_trade_item_id"
  end

  create_table "crm_source_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "crm/source_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_crm_source_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_crm_source_hierarchies_on_descendant_id"
  end

  create_table "crm_sources", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.string "name"
    t.boolean "materialize"
    t.integer "fixed_width"
    t.jsonb "parent_ancestors"
    t.string "sku"
    t.decimal "price"
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.jsonb "wallet_price"
    t.jsonb "extra"
    t.string "unit"
    t.decimal "quantity"
    t.decimal "unified_quantity"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.string "good_type"
    t.decimal "step", comment: "Item Number Step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_crm_sources_on_parent_id"
  end

  create_table "crm_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "logged_type"
    t.string "entity_column"
    t.string "entity_value"
    t.string "color"
    t.integer "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crm_texts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "source_id"
    t.string "note"
    t.integer "margin_x"
    t.integer "margin_y"
    t.string "font"
    t.string "align"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_crm_texts_on_source_id"
  end

  create_table "datum_data_lists", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "title"
    t.string "comment"
    t.string "type"
    t.jsonb "columns"
    t.integer "x_position"
    t.string "data_table"
    t.string "export_excel"
    t.string "export_pdf"
    t.jsonb "parameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "datum_export_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "export_id"
    t.jsonb "fields"
    t.integer "position"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["export_id"], name: "index_datum_export_items_on_export_id"
  end

  create_table "datum_exports", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "template_id"
    t.string "name"
    t.string "code"
    t.jsonb "formats"
    t.jsonb "editable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_datum_exports_on_template_id"
  end

  create_table "datum_record_lists", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "data_list_id"
    t.jsonb "columns"
    t.jsonb "parameters"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_list_id"], name: "index_datum_record_lists_on_data_list_id"
  end

  create_table "datum_table_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "table_list_id"
    t.jsonb "fields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table_list_id"], name: "index_datum_table_items_on_table_list_id"
  end

  create_table "datum_table_lists", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "data_list_id"
    t.jsonb "parameters"
    t.jsonb "headers"
    t.jsonb "footers"
    t.integer "table_items_count"
    t.string "timestamp"
    t.boolean "done"
    t.boolean "published"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_list_id"], name: "index_datum_table_lists_on_data_list_id"
  end

  create_table "datum_template_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "template_id"
    t.jsonb "fields"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_datum_template_items_on_template_id"
  end

  create_table "datum_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.string "code"
    t.jsonb "headers"
    t.integer "header_line"
    t.integer "template_items_count"
    t.datetime "uploaded_at"
    t.jsonb "parameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_datum_templates_on_organ_id"
  end

  create_table "datum_validations", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "template_id"
    t.string "sheet"
    t.string "header"
    t.jsonb "fields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_datum_validations_on_template_id"
  end

  create_table "debug_manies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "one_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["one_id"], name: "index_debug_manies_on_one_id"
  end

  create_table "debug_muches", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debug_ones", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debug_throughs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "many_id"
    t.uuid "much_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["many_id"], name: "index_debug_throughs_on_many_id"
    t.index ["much_id"], name: "index_debug_throughs_on_much_id"
  end

  create_table "detail_contents", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "detail_type"
    t.uuid "detail_id"
    t.uuid "author_id"
    t.string "type"
    t.string "title"
    t.text "body"
    t.integer "position"
    t.string "list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_detail_contents_on_author_id"
    t.index ["detail_type", "detail_id"], name: "index_detail_contents_on_detail"
  end

  create_table "detail_entity_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "entity_type"
    t.uuid "entity_id"
    t.uuid "taxon_item_id"
    t.uuid "item_id"
    t.uuid "list_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_detail_entity_items_on_entity"
    t.index ["item_id"], name: "index_detail_entity_items_on_item_id"
    t.index ["list_id"], name: "index_detail_entity_items_on_list_id"
    t.index ["taxon_item_id"], name: "index_detail_entity_items_on_taxon_item_id"
  end

  create_table "detail_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "list_id"
    t.string "name"
    t.string "type"
    t.string "key"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_detail_items_on_list_id"
  end

  create_table "detail_knowings", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "knowable_type"
    t.uuid "knowable_id"
    t.uuid "knowledge_id"
    t.boolean "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["knowable_type", "knowable_id"], name: "index_detail_knowings_on_knowable"
    t.index ["knowledge_id"], name: "index_detail_knowings_on_knowledge_id"
  end

  create_table "detail_knowledge_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "detail/knowledge_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_detail_knowledge_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_detail_knowledge_hierarchies_on_descendant_id"
  end

  create_table "detail_knowledges", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.string "title"
    t.text "body"
    t.integer "position"
    t.jsonb "parent_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_detail_knowledges_on_parent_id"
  end

  create_table "detail_lists", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.string "status"
    t.integer "position"
    t.integer "items_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_detail_lists_on_organ_id"
  end

  create_table "detail_post_syncs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "post_id"
    t.string "synced_type"
    t.uuid "synced_id"
    t.string "source_id"
    t.datetime "synced_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_detail_post_syncs_on_post_id"
    t.index ["synced_type", "synced_id"], name: "index_detail_post_syncs_on_synced"
  end

  create_table "detail_posts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "thumb_media_id"
    t.string "title"
    t.string "content"
    t.string "link"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_detail_posts_on_organ_id"
  end

  create_table "detail_taxon_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "taxon_type"
    t.uuid "taxon_id"
    t.uuid "item_id"
    t.uuid "list_id"
    t.string "default_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_detail_taxon_items_on_item_id"
    t.index ["list_id"], name: "index_detail_taxon_items_on_list_id"
    t.index ["taxon_type", "taxon_id"], name: "index_detail_taxon_items_on_taxon"
  end

  create_table "doc_maps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.jsonb "mappings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doc_subjects", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "rule_id"
    t.string "name"
    t.jsonb "path_params"
    t.jsonb "request_params"
    t.jsonb "request_headers"
    t.string "request_type"
    t.jsonb "request_body"
    t.string "response_status"
    t.jsonb "response_headers"
    t.string "response_type"
    t.string "response_body"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rule_id"], name: "index_doc_subjects_on_rule_id"
  end

  create_table "douyin_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.string "appid"
    t.string "secret"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "refresh_token"
    t.datetime "refresh_token_expires_at"
    t.string "open_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_douyin_apps_on_appid"
    t.index ["organ_id"], name: "index_douyin_apps_on_organ_id"
  end

  create_table "douyin_orders", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "poi_id"
    t.string "appid"
    t.string "code"
    t.string "verify_id"
    t.string "certificate_id"
    t.string "origin_code"
    t.string "account_id"
    t.string "uuid"
    t.string "verify_token"
    t.jsonb "extra"
    t.jsonb "verify_results"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "douyin_shops", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.string "appid"
    t.string "poi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_douyin_shops_on_appid"
    t.index ["organ_id"], name: "index_douyin_shops_on_organ_id"
  end

  create_table "email_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "template_id"
    t.string "mail_from"
    t.string "message_object_id"
    t.string "mailer"
    t.string "action_name"
    t.string "params"
    t.string "subject"
    t.string "mail_to"
    t.string "cc_to"
    t.string "sent_status"
    t.string "sent_string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_email_logs_on_template_id"
  end

  create_table "email_reasons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_smtp_accounts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "smtp_id"
    t.string "user_name"
    t.string "password"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position"], name: "index_email_smtp_accounts_on_position"
    t.index ["smtp_id"], name: "index_email_smtp_accounts_on_smtp_id"
  end

  create_table "email_smtps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "address"
    t.string "port"
    t.boolean "enable_starttls_auto"
    t.boolean "ssl"
    t.string "authentication"
    t.string "openssl_verify_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_subscriptions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "smtp_id"
    t.uuid "smtp_account_id"
    t.uuid "reason_id"
    t.string "address"
    t.datetime "subscribe_at"
    t.datetime "unsubscribe_at"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reason_id"], name: "index_email_subscriptions_on_reason_id"
    t.index ["smtp_account_id"], name: "index_email_subscriptions_on_smtp_account_id"
    t.index ["smtp_id"], name: "index_email_subscriptions_on_smtp_id"
  end

  create_table "email_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "contact"
    t.string "subject"
    t.string "honorific"
    t.string "body"
    t.string "order_prefix"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_email_templates_on_organ_id"
    t.index ["position"], name: "index_email_templates_on_position"
  end

  create_table "eventual_bookings", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "booker_type"
    t.uuid "booker_id"
    t.string "booked_type"
    t.uuid "booked_id"
    t.uuid "plan_item_id"
    t.uuid "time_item_id"
    t.uuid "place_id"
    t.uuid "seat_id"
    t.date "booking_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booked_type", "booked_id"], name: "index_eventual_bookings_on_booked"
    t.index ["booker_type", "booker_id"], name: "index_eventual_bookings_on_booker"
    t.index ["place_id"], name: "index_eventual_bookings_on_place_id"
    t.index ["plan_item_id"], name: "index_eventual_bookings_on_plan_item_id"
    t.index ["seat_id"], name: "index_eventual_bookings_on_seat_id"
    t.index ["time_item_id"], name: "index_eventual_bookings_on_time_item_id"
  end

  create_table "eventual_crowd_members", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "crowd_id"
    t.string "member_type"
    t.uuid "member_id"
    t.uuid "agency_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_eventual_crowd_members_on_agency_id"
    t.index ["crowd_id"], name: "index_eventual_crowd_members_on_crowd_id"
    t.index ["member_type", "member_id"], name: "index_eventual_crowd_members_on_member"
  end

  create_table "eventual_crowds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.string "member_type"
    t.integer "crowd_members_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_eventual_crowds_on_organ_id"
  end

  create_table "eventual_event_crowds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "event_id"
    t.uuid "crowd_id"
    t.integer "present_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crowd_id"], name: "index_eventual_event_crowds_on_crowd_id"
    t.index ["event_id"], name: "index_eventual_event_crowds_on_event_id"
  end

  create_table "eventual_event_grants", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "event_id"
    t.string "grant_kind"
    t.string "grant_column"
    t.jsonb "filter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_eventual_event_grants_on_event_id"
  end

  create_table "eventual_event_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "event_id"
    t.uuid "author_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_eventual_event_items_on_author_id"
    t.index ["event_id"], name: "index_eventual_event_items_on_event_id"
  end

  create_table "eventual_event_participants", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "event_crowd_id"
    t.uuid "event_id"
    t.uuid "crowd_member_id"
    t.string "participant_type"
    t.uuid "participant_id"
    t.integer "score"
    t.string "comment"
    t.string "quit_note"
    t.string "assigned_status"
    t.string "job_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crowd_member_id"], name: "index_eventual_event_participants_on_crowd_member_id"
    t.index ["event_crowd_id"], name: "index_eventual_event_participants_on_event_crowd_id"
    t.index ["event_id"], name: "index_eventual_event_participants_on_event_id"
    t.index ["participant_type", "participant_id"], name: "index_eventual_event_participants_on_participant"
  end

  create_table "eventual_event_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_eventual_event_taxons_on_organ_id"
  end

  create_table "eventual_events", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "event_taxon_id"
    t.uuid "time_list_id"
    t.uuid "place_id"
    t.string "name"
    t.string "description"
    t.integer "position"
    t.integer "event_participants_count"
    t.integer "event_items_count"
    t.integer "members_count"
    t.date "begin_on"
    t.date "end_on"
    t.date "produced_begin_on"
    t.date "produced_end_on"
    t.boolean "produce_done"
    t.string "repeat_type"
    t.integer "repeat_count", comment: "每几周/天"
    t.string "repeat_days", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_taxon_id"], name: "index_eventual_events_on_event_taxon_id"
    t.index ["organ_id"], name: "index_eventual_events_on_organ_id"
    t.index ["place_id"], name: "index_eventual_events_on_place_id"
    t.index ["time_list_id"], name: "index_eventual_events_on_time_list_id"
  end

  create_table "eventual_place_taxon_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "eventual/place_taxon_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_eventual_place_taxon_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_eventual_place_taxon_hierarchies_on_descendant_id"
  end

  create_table "eventual_place_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.uuid "organ_id"
    t.jsonb "parent_ancestors"
    t.string "name"
    t.integer "position"
    t.decimal "profit_margin"
    t.integer "places_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_eventual_place_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_eventual_place_taxons_on_parent_id"
  end

  create_table "eventual_places", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "area_id"
    t.uuid "place_taxon_id"
    t.string "name"
    t.string "description"
    t.string "color"
    t.integer "seats_count"
    t.integer "plans_count"
    t.jsonb "place_taxon_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_eventual_places_on_area_id"
    t.index ["organ_id"], name: "index_eventual_places_on_organ_id"
    t.index ["place_taxon_id"], name: "index_eventual_places_on_place_taxon_id"
  end

  create_table "eventual_plan_attenders", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "plan_participant_id"
    t.string "attender_type"
    t.uuid "attender_id"
    t.uuid "plan_item_id"
    t.uuid "plan_id"
    t.uuid "place_id"
    t.boolean "attended"
    t.string "state"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attender_type", "attender_id"], name: "index_eventual_plan_attenders_on_attender"
    t.index ["place_id"], name: "index_eventual_plan_attenders_on_place_id"
    t.index ["plan_id"], name: "index_eventual_plan_attenders_on_plan_id"
    t.index ["plan_item_id"], name: "index_eventual_plan_attenders_on_plan_item_id"
    t.index ["plan_participant_id"], name: "index_eventual_plan_attenders_on_plan_participant_id"
  end

  create_table "eventual_plan_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "time_item_id"
    t.uuid "time_list_id"
    t.string "planned_type"
    t.uuid "planned_id"
    t.uuid "place_id"
    t.uuid "event_id"
    t.uuid "event_item_id"
    t.date "plan_on"
    t.integer "bookings_count"
    t.integer "plan_participants_count"
    t.string "repeat_index"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_eventual_plan_items_on_event_id"
    t.index ["event_item_id"], name: "index_eventual_plan_items_on_event_item_id"
    t.index ["place_id"], name: "index_eventual_plan_items_on_place_id"
    t.index ["planned_type", "planned_id"], name: "index_eventual_plan_items_on_planned"
    t.index ["time_item_id"], name: "index_eventual_plan_items_on_time_item_id"
    t.index ["time_list_id"], name: "index_eventual_plan_items_on_time_list_id"
  end

  create_table "eventual_plan_participants", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "planning_type"
    t.uuid "planning_id"
    t.uuid "event_participant_id"
    t.string "participant_type"
    t.uuid "participant_id"
    t.string "type"
    t.string "status", comment: "默认 event_participant 有效"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_participant_id"], name: "index_eventual_plan_participants_on_event_participant_id"
    t.index ["participant_type", "participant_id"], name: "index_eventual_plan_participants_on_participant"
    t.index ["planning_type", "planning_id"], name: "index_eventual_plan_participants_on_planning"
  end

  create_table "eventual_seats", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "place_id"
    t.string "name"
    t.integer "min_members"
    t.integer "max_members"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_eventual_seats_on_place_id"
  end

  create_table "eventual_time_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "time_list_id"
    t.integer "position"
    t.time "start_at"
    t.time "finish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_list_id"], name: "index_eventual_time_items_on_time_list_id"
  end

  create_table "eventual_time_lists", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.string "code"
    t.string "kind"
    t.integer "item_minutes"
    t.integer "interval_minutes"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_eventual_time_lists_on_organ_id"
  end

  create_table "factory_brands", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.string "code"
    t.integer "products_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_brands_on_organ_id"
  end

  create_table "factory_component_parts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "component_id"
    t.uuid "taxon_id"
    t.uuid "product_id"
    t.uuid "part_id"
    t.boolean "default"
    t.integer "min"
    t.integer "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_factory_component_parts_on_component_id"
    t.index ["part_id"], name: "index_factory_component_parts_on_part_id"
    t.index ["product_id"], name: "index_factory_component_parts_on_product_id"
    t.index ["taxon_id"], name: "index_factory_component_parts_on_taxon_id"
  end

  create_table "factory_components", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "part_taxon_id"
    t.uuid "taxon_id"
    t.uuid "product_id"
    t.string "type"
    t.string "name"
    t.integer "min_select"
    t.integer "max_select"
    t.integer "component_parts_count"
    t.boolean "multiple"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_taxon_id"], name: "index_factory_components_on_part_taxon_id"
    t.index ["product_id"], name: "index_factory_components_on_product_id"
    t.index ["taxon_id"], name: "index_factory_components_on_taxon_id"
  end

  create_table "factory_factory_providers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "factory_taxon_id"
    t.uuid "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factory_taxon_id"], name: "index_factory_factory_providers_on_factory_taxon_id"
    t.index ["provider_id"], name: "index_factory_factory_providers_on_provider_id"
  end

  create_table "factory_factory_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "scene_id"
    t.string "name"
    t.integer "position"
    t.integer "factory_providers_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scene_id"], name: "index_factory_factory_taxons_on_scene_id"
  end

  create_table "factory_fits", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "product_id"
    t.uuid "production_id"
    t.uuid "part_brand_id"
    t.uuid "part_serial_id"
    t.uuid "part_product_id"
    t.uuid "part_production_id"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_brand_id"], name: "index_factory_fits_on_part_brand_id"
    t.index ["part_product_id"], name: "index_factory_fits_on_part_product_id"
    t.index ["part_production_id"], name: "index_factory_fits_on_part_production_id"
    t.index ["part_serial_id"], name: "index_factory_fits_on_part_serial_id"
    t.index ["product_id"], name: "index_factory_fits_on_product_id"
    t.index ["production_id"], name: "index_factory_fits_on_production_id"
  end

  create_table "factory_part_plans", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "part_id"
    t.uuid "product_id"
    t.uuid "production_id"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string "state"
    t.integer "purchased_count"
    t.integer "received_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_factory_part_plans_on_part_id"
    t.index ["product_id"], name: "index_factory_part_plans_on_product_id"
    t.index ["production_id"], name: "index_factory_part_plans_on_production_id"
  end

  create_table "factory_produce_plans", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "scene_id"
    t.string "title"
    t.date "produce_on"
    t.integer "serial_number"
    t.datetime "book_finish_at"
    t.datetime "book_start_at"
    t.integer "production_plans_count"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_produce_plans_on_organ_id"
    t.index ["scene_id"], name: "index_factory_produce_plans_on_scene_id"
  end

  create_table "factory_produces", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factory_product_produces", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "product_id"
    t.uuid "produce_id"
    t.integer "position"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produce_id"], name: "index_factory_product_produces_on_produce_id"
    t.index ["product_id"], name: "index_factory_product_produces_on_product_id"
  end

  create_table "factory_product_provides", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "provide_id"
    t.uuid "product_id"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_factory_product_provides_on_product_id"
    t.index ["provide_id"], name: "index_factory_product_provides_on_provide_id"
  end

  create_table "factory_production_carts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "cart_id"
    t.uuid "user_id"
    t.uuid "product_id"
    t.uuid "production_id"
    t.string "state"
    t.datetime "customized_at"
    t.decimal "original_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_factory_production_carts_on_cart_id"
    t.index ["product_id"], name: "index_factory_production_carts_on_product_id"
    t.index ["production_id"], name: "index_factory_production_carts_on_production_id"
    t.index ["user_id"], name: "index_factory_production_carts_on_user_id"
  end

  create_table "factory_production_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "production_id"
    t.uuid "product_item_id"
    t.uuid "grid_id"
    t.uuid "room_id"
    t.uuid "building_id"
    t.uuid "station_id"
    t.string "code"
    t.decimal "amount"
    t.datetime "came_at"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_factory_production_items_on_building_id"
    t.index ["grid_id"], name: "index_factory_production_items_on_grid_id"
    t.index ["product_item_id"], name: "index_factory_production_items_on_product_item_id"
    t.index ["production_id"], name: "index_factory_production_items_on_production_id"
    t.index ["room_id"], name: "index_factory_production_items_on_room_id"
    t.index ["station_id"], name: "index_factory_production_items_on_station_id"
  end

  create_table "factory_production_parts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "part_taxon_id"
    t.uuid "product_id"
    t.uuid "production_id"
    t.uuid "part_id"
    t.uuid "component_id"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_factory_production_parts_on_component_id"
    t.index ["part_id"], name: "index_factory_production_parts_on_part_id"
    t.index ["part_taxon_id"], name: "index_factory_production_parts_on_part_taxon_id"
    t.index ["product_id"], name: "index_factory_production_parts_on_product_id"
    t.index ["production_id"], name: "index_factory_production_parts_on_production_id"
  end

  create_table "factory_production_plans", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "station_id"
    t.uuid "production_id"
    t.uuid "product_id"
    t.uuid "scene_id"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.date "produce_on"
    t.string "state"
    t.integer "planned_count"
    t.integer "production_items_count"
    t.boolean "specialty", comment: "主推"
    t.integer "trade_items_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_production_plans_on_organ_id"
    t.index ["product_id"], name: "index_factory_production_plans_on_product_id"
    t.index ["production_id"], name: "index_factory_production_plans_on_production_id"
    t.index ["scene_id"], name: "index_factory_production_plans_on_scene_id"
    t.index ["station_id"], name: "index_factory_production_plans_on_station_id"
  end

  create_table "factory_production_provides", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "provide_id"
    t.uuid "taxon_id"
    t.uuid "product_id"
    t.uuid "production_id"
    t.string "provide_config_type"
    t.uuid "provide_config_id"
    t.uuid "upstream_product_id"
    t.uuid "upstream_production_id"
    t.decimal "cost_price"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_factory_production_provides_on_product_id"
    t.index ["production_id"], name: "index_factory_production_provides_on_production_id"
    t.index ["provide_config_type", "provide_config_id"], name: "index_factory_production_provides_on_provide_config"
    t.index ["provide_id"], name: "index_factory_production_provides_on_provide_id"
    t.index ["taxon_id"], name: "index_factory_production_provides_on_taxon_id"
    t.index ["upstream_product_id"], name: "index_factory_production_provides_on_upstream_product_id"
    t.index ["upstream_production_id"], name: "index_factory_production_provides_on_upstream_production_id"
  end

  create_table "factory_production_spaces", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "production_id"
    t.uuid "grid_id"
    t.uuid "room_id"
    t.uuid "desk_id"
    t.uuid "building_id"
    t.uuid "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_factory_production_spaces_on_building_id"
    t.index ["desk_id"], name: "index_factory_production_spaces_on_desk_id"
    t.index ["grid_id"], name: "index_factory_production_spaces_on_grid_id"
    t.index ["production_id"], name: "index_factory_production_spaces_on_production_id"
    t.index ["room_id"], name: "index_factory_production_spaces_on_room_id"
    t.index ["station_id"], name: "index_factory_production_spaces_on_station_id"
  end

  create_table "factory_productions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "product_id"
    t.uuid "product_host_id"
    t.uuid "taxon_id"
    t.uuid "factory_taxon_id"
    t.string "name"
    t.string "qr_code"
    t.decimal "price"
    t.decimal "cost_price", comment: "成本价"
    t.decimal "profit_price", comment: "利润"
    t.string "str_part_ids"
    t.boolean "default"
    t.boolean "enabled"
    t.boolean "automatic"
    t.boolean "presell", comment: "预售"
    t.string "link"
    t.integer "position"
    t.decimal "stock"
    t.jsonb "last_stock_log"
    t.string "word", comment: "搜索关键词"
    t.string "state"
    t.string "sku"
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.jsonb "wallet_price"
    t.jsonb "extra"
    t.string "unit"
    t.decimal "quantity"
    t.decimal "unified_quantity"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.string "good_type"
    t.decimal "step", comment: "Item Number Step"
    t.integer "rent_charges_count"
    t.string "rent_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factory_taxon_id"], name: "index_factory_productions_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_productions_on_organ_id"
    t.index ["product_host_id"], name: "index_factory_productions_on_product_host_id"
    t.index ["product_id"], name: "index_factory_productions_on_product_id"
    t.index ["str_part_ids"], name: "index_factory_productions_on_str_part_ids"
    t.index ["taxon_id"], name: "index_factory_productions_on_taxon_id"
  end

  create_table "factory_products", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "unifier_id"
    t.uuid "factory_taxon_id"
    t.uuid "taxon_id"
    t.uuid "brand_id"
    t.string "name"
    t.string "description"
    t.string "qr_prefix"
    t.string "sku"
    t.boolean "published"
    t.boolean "specialty"
    t.decimal "base_price"
    t.integer "order_items_count"
    t.integer "productions_count"
    t.integer "product_parts_count"
    t.integer "fits_count"
    t.integer "position"
    t.decimal "profit_margin"
    t.decimal "min_price"
    t.decimal "max_price"
    t.jsonb "taxon_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_factory_products_on_brand_id"
    t.index ["factory_taxon_id"], name: "index_factory_products_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_products_on_organ_id"
    t.index ["sku"], name: "index_factory_products_on_sku"
    t.index ["taxon_id"], name: "index_factory_products_on_taxon_id"
    t.index ["unifier_id"], name: "index_factory_products_on_unifier_id"
  end

  create_table "factory_provides", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "provider_id"
    t.uuid "factory_provider_id"
    t.string "name"
    t.string "invite_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factory_provider_id"], name: "index_factory_provides_on_factory_provider_id"
    t.index ["organ_id"], name: "index_factory_provides_on_organ_id"
    t.index ["provider_id"], name: "index_factory_provides_on_provider_id"
  end

  create_table "factory_scene_automatics", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "scene_id"
    t.integer "advance_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_scene_automatics_on_organ_id"
    t.index ["scene_id"], name: "index_factory_scene_automatics_on_scene_id"
  end

  create_table "factory_scenes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "title"
    t.integer "book_start_days"
    t.time "book_start_at"
    t.integer "book_finish_days"
    t.time "book_finish_at"
    t.time "deliver_start_at"
    t.time "deliver_finish_at"
    t.boolean "specialty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_scenes_on_organ_id"
  end

  create_table "factory_serial_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "factory/serial_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_factory_serial_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_factory_serial_hierarchies_on_descendant_id"
  end

  create_table "factory_serials", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "brand_id"
    t.uuid "parent_id"
    t.string "name"
    t.integer "position"
    t.integer "products_count"
    t.jsonb "parent_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_factory_serials_on_brand_id"
    t.index ["parent_id"], name: "index_factory_serials_on_parent_id"
  end

  create_table "factory_stock_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "production_id"
    t.string "source_type"
    t.uuid "source_id"
    t.string "title"
    t.string "tag_str"
    t.decimal "amount"
    t.decimal "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["production_id"], name: "index_factory_stock_logs_on_production_id"
    t.index ["source_type", "source_id"], name: "index_factory_stock_logs_on_source"
  end

  create_table "factory_taxon_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "factory/taxon_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_factory_taxon_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_factory_taxon_hierarchies_on_descendant_id"
  end

  create_table "factory_taxon_provides", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "provide_id"
    t.uuid "taxon_id"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provide_id"], name: "index_factory_taxon_provides_on_provide_id"
    t.index ["taxon_id"], name: "index_factory_taxon_provides_on_taxon_id"
  end

  create_table "factory_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.uuid "organ_id"
    t.uuid "factory_taxon_id"
    t.uuid "scene_id"
    t.jsonb "parent_ancestors"
    t.string "name"
    t.integer "position"
    t.boolean "enabled"
    t.boolean "nav", comment: "单独分类"
    t.integer "products_count"
    t.integer "provides_count"
    t.integer "taxon_components_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "countable", comment: "可盘点"
    t.boolean "customizable", comment: "可定制"
    t.index ["factory_taxon_id"], name: "index_factory_taxons_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_factory_taxons_on_parent_id"
    t.index ["scene_id"], name: "index_factory_taxons_on_scene_id"
  end

  create_table "factory_unifiers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finance_assessments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.decimal "amount"
    t.decimal "trustee_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_finance_assessments_on_organ_id"
  end

  create_table "finance_budgets", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "member_id"
    t.string "financial_type"
    t.uuid "financial_id"
    t.uuid "fund_id"
    t.uuid "stock_id"
    t.uuid "financial_taxon_id"
    t.uuid "task_id"
    t.decimal "amount"
    t.string "type"
    t.string "subject"
    t.string "note"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["financial_taxon_id"], name: "index_finance_budgets_on_financial_taxon_id"
    t.index ["financial_type", "financial_id"], name: "index_finance_budgets_on_financial"
    t.index ["fund_id"], name: "index_finance_budgets_on_fund_id"
    t.index ["member_id"], name: "index_finance_budgets_on_member_id"
    t.index ["organ_id"], name: "index_finance_budgets_on_organ_id"
    t.index ["stock_id"], name: "index_finance_budgets_on_stock_id"
    t.index ["task_id"], name: "index_finance_budgets_on_task_id"
  end

  create_table "finance_expense_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "expense_id"
    t.uuid "budget_id"
    t.uuid "financial_taxon_id"
    t.decimal "budget_amount"
    t.decimal "amount"
    t.string "note"
    t.string "state"
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_finance_expense_items_on_budget_id"
    t.index ["expense_id"], name: "index_finance_expense_items_on_expense_id"
    t.index ["financial_taxon_id"], name: "index_finance_expense_items_on_financial_taxon_id"
  end

  create_table "finance_expense_members", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "expense_id"
    t.uuid "payment_method_id"
    t.decimal "amount"
    t.decimal "advance"
    t.string "state"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_finance_expense_members_on_expense_id"
    t.index ["member_id"], name: "index_finance_expense_members_on_member_id"
    t.index ["payment_method_id"], name: "index_finance_expense_members_on_payment_method_id"
  end

  create_table "finance_expenses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "creator_id"
    t.uuid "payment_method_id"
    t.string "financial_type"
    t.uuid "financial_id"
    t.uuid "budget_id"
    t.uuid "fund_id"
    t.uuid "stock_id"
    t.uuid "financial_taxon_id"
    t.uuid "payout_id"
    t.string "type"
    t.string "state"
    t.string "subject"
    t.decimal "amount"
    t.string "note"
    t.integer "invoices_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_finance_expenses_on_budget_id"
    t.index ["creator_id"], name: "index_finance_expenses_on_creator_id"
    t.index ["financial_taxon_id"], name: "index_finance_expenses_on_financial_taxon_id"
    t.index ["financial_type", "financial_id"], name: "index_finance_expenses_on_financial"
    t.index ["fund_id"], name: "index_finance_expenses_on_fund_id"
    t.index ["organ_id"], name: "index_finance_expenses_on_organ_id"
    t.index ["payment_method_id"], name: "index_finance_expenses_on_payment_method_id"
    t.index ["payout_id"], name: "index_finance_expenses_on_payout_id"
    t.index ["stock_id"], name: "index_finance_expenses_on_stock_id"
  end

  create_table "finance_fund_incomes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "fund_id"
    t.uuid "user_id"
    t.string "financial_type"
    t.uuid "financial_id"
    t.decimal "amount"
    t.boolean "visible"
    t.string "note"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["financial_type", "financial_id"], name: "index_finance_fund_incomes_on_financial"
    t.index ["fund_id"], name: "index_finance_fund_incomes_on_fund_id"
    t.index ["user_id"], name: "index_finance_fund_incomes_on_user_id"
  end

  create_table "finance_funds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.string "name"
    t.decimal "amount"
    t.decimal "budget_amount"
    t.jsonb "budget_detail"
    t.decimal "expense_amount"
    t.jsonb "expense_detail"
    t.string "note"
    t.string "sku"
    t.decimal "price"
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.jsonb "wallet_price"
    t.jsonb "extra"
    t.string "unit"
    t.decimal "quantity"
    t.decimal "unified_quantity"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.string "good_type"
    t.decimal "step", comment: "Item Number Step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_finance_funds_on_organ_id"
    t.index ["user_id"], name: "index_finance_funds_on_user_id"
  end

  create_table "finance_stocks", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "organ_id"
    t.uuid "assessment_id"
    t.decimal "ratio"
    t.decimal "assess_amount"
    t.integer "amount", comment: "发行量"
    t.integer "expense_amount"
    t.jsonb "expense_detail"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_finance_stocks_on_assessment_id"
    t.index ["member_id"], name: "index_finance_stocks_on_member_id"
    t.index ["organ_id"], name: "index_finance_stocks_on_organ_id"
  end

  create_table "finance_taxon_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "finance/taxon_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_finance_taxon_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_finance_taxon_hierarchies_on_descendant_id"
  end

  create_table "finance_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.uuid "organ_id"
    t.jsonb "parent_ancestors"
    t.string "name"
    t.integer "position"
    t.boolean "take_stock", comment: "是否有库存"
    t.boolean "individual", comment: "是否可盘点"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_finance_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_finance_taxons_on_parent_id"
  end

  create_table "growth_aim_codes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "aim_id"
    t.string "controller_path"
    t.string "action_name"
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aim_id"], name: "index_growth_aim_codes_on_aim_id"
  end

  create_table "growth_aim_entities", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "aim_id"
    t.string "entity_type"
    t.uuid "entity_id"
    t.uuid "reward_expense_id"
    t.string "text_year"
    t.string "text_month"
    t.string "text_week"
    t.string "text_date"
    t.integer "present_point"
    t.string "state"
    t.datetime "last_access_at"
    t.string "ip"
    t.decimal "reward_amount"
    t.integer "aim_logs_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aim_id"], name: "index_growth_aim_entities_on_aim_id"
    t.index ["entity_type", "entity_id"], name: "index_growth_aim_entities_on_entity"
    t.index ["reward_expense_id"], name: "index_growth_aim_entities_on_reward_expense_id"
    t.index ["user_id"], name: "index_growth_aim_entities_on_user_id"
  end

  create_table "growth_aim_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "aim_id"
    t.string "entity_type"
    t.uuid "entity_id"
    t.string "serial_number"
    t.string "ip"
    t.string "code"
    t.boolean "rewarded"
    t.datetime "created_at", null: false
    t.index ["aim_id"], name: "index_growth_aim_logs_on_aim_id"
    t.index ["entity_type", "entity_id"], name: "index_growth_aim_logs_on_entity"
    t.index ["user_id"], name: "index_growth_aim_logs_on_user_id"
  end

  create_table "growth_aim_users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "aim_id"
    t.string "text_year"
    t.string "text_month"
    t.string "text_week"
    t.string "text_date"
    t.string "state"
    t.integer "reward_amount"
    t.integer "aim_entities_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aim_id"], name: "index_growth_aim_users_on_aim_id"
    t.index ["user_id"], name: "index_growth_aim_users_on_user_id"
  end

  create_table "growth_aims", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.string "repeat_type"
    t.decimal "rate"
    t.integer "task_point"
    t.integer "reward_point"
    t.integer "reward_amount"
    t.boolean "verbose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "growth_praise_incomes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "reward_id"
    t.uuid "user_id"
    t.uuid "earner_id"
    t.string "source_type"
    t.uuid "source_id"
    t.decimal "amount", comment: "用户打赏"
    t.decimal "profit_amount", comment: "平台收入"
    t.decimal "royalty_amount", comment: "作者分成"
    t.decimal "reward_amount", comment: "赏金池"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["earner_id"], name: "index_growth_praise_incomes_on_earner_id"
    t.index ["reward_id"], name: "index_growth_praise_incomes_on_reward_id"
    t.index ["source_type", "source_id"], name: "index_growth_praise_incomes_on_source"
    t.index ["user_id"], name: "index_growth_praise_incomes_on_user_id"
  end

  create_table "growth_praise_users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "reward_id"
    t.string "entity_type"
    t.uuid "entity_id"
    t.decimal "amount"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_growth_praise_users_on_entity"
    t.index ["reward_id"], name: "index_growth_praise_users_on_reward_id"
    t.index ["user_id"], name: "index_growth_praise_users_on_user_id"
  end

  create_table "growth_reward_expenses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "reward_id"
    t.uuid "aim_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aim_id"], name: "index_growth_reward_expenses_on_aim_id"
    t.index ["reward_id"], name: "index_growth_reward_expenses_on_reward_id"
    t.index ["user_id"], name: "index_growth_reward_expenses_on_user_id"
  end

  create_table "growth_reward_incomes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "reward_id"
    t.uuid "user_id"
    t.decimal "reward_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reward_id"], name: "index_growth_reward_incomes_on_reward_id"
    t.index ["user_id"], name: "index_growth_reward_incomes_on_user_id"
  end

  create_table "growth_rewards", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "entity_type"
    t.uuid "entity_id"
    t.decimal "min_piece"
    t.decimal "max_piece"
    t.decimal "amount"
    t.decimal "income_amount"
    t.decimal "expense_amount"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.boolean "enabled"
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_growth_rewards_on_entity"
  end

  create_table "interact_abuses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "abusement_type"
    t.uuid "abusement_id"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abusement_type", "abusement_id"], name: "index_interact_abuses_on_abusement"
    t.index ["user_id"], name: "index_interact_abuses_on_user_id"
  end

  create_table "interact_attitudes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "attitudinal_type"
    t.uuid "attitudinal_id"
    t.string "opinion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attitudinal_type", "attitudinal_id"], name: "index_interact_attitudes_on_attitudinal"
    t.index ["user_id"], name: "index_interact_attitudes_on_user_id"
  end

  create_table "interact_comments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "parent_id"
    t.string "commentable_type"
    t.uuid "commentable_id"
    t.string "title"
    t.string "content"
    t.string "state"
    t.float "score"
    t.integer "liked_count"
    t.integer "star_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_interact_comments_on_commentable"
    t.index ["parent_id"], name: "index_interact_comments_on_parent_id"
    t.index ["user_id"], name: "index_interact_comments_on_user_id"
  end

  create_table "interact_stars", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "starred_type"
    t.uuid "starred_id"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["starred_type", "starred_id"], name: "index_interact_stars_on_starred"
    t.index ["user_id"], name: "index_interact_stars_on_user_id"
  end

  create_table "markdown_assets", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "git_id"
    t.string "name"
    t.string "path"
    t.string "download_url"
    t.string "sha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["git_id"], name: "index_markdown_assets_on_git_id"
  end

  create_table "markdown_catalogs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "git_id"
    t.string "name"
    t.string "path"
    t.string "parent_path"
    t.integer "position"
    t.boolean "nav", comment: "是否导航菜单"
    t.integer "depth"
    t.string "home_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["git_id"], name: "index_markdown_catalogs_on_git_id"
    t.index ["organ_id"], name: "index_markdown_catalogs_on_organ_id"
  end

  create_table "markdown_gits", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "identity"
    t.string "type"
    t.string "base_name"
    t.string "working_directory"
    t.string "remote_url"
    t.string "last_commit_message"
    t.datetime "last_commit_at"
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_markdown_gits_on_organ_id"
  end

  create_table "markdown_posts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "git_id"
    t.uuid "organ_id"
    t.string "title"
    t.string "markdown"
    t.string "html"
    t.string "layout"
    t.string "path"
    t.string "slug"
    t.string "catalog_path"
    t.string "oid"
    t.boolean "published"
    t.boolean "shared"
    t.boolean "ppt"
    t.boolean "nav", comment: "是否导航菜单"
    t.datetime "last_commit_at"
    t.string "target"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["git_id"], name: "index_markdown_posts_on_git_id"
    t.index ["organ_id"], name: "index_markdown_posts_on_organ_id"
  end

  create_table "notice_announcement_departments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "announcement_id"
    t.uuid "department_id"
    t.uuid "organ_id"
    t.integer "notifications_count"
    t.string "state"
    t.datetime "announce_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_notice_announcement_departments_on_announcement_id"
    t.index ["department_id"], name: "index_notice_announcement_departments_on_department_id"
    t.index ["organ_id"], name: "index_notice_announcement_departments_on_organ_id"
  end

  create_table "notice_announcement_job_titles", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "announcement_id"
    t.uuid "job_title_id"
    t.uuid "department_id"
    t.uuid "organ_id"
    t.integer "notifications_count"
    t.string "state"
    t.datetime "announce_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_notice_announcement_job_titles_on_announcement_id"
    t.index ["department_id"], name: "index_notice_announcement_job_titles_on_department_id"
    t.index ["job_title_id"], name: "index_notice_announcement_job_titles_on_job_title_id"
    t.index ["organ_id"], name: "index_notice_announcement_job_titles_on_organ_id"
  end

  create_table "notice_announcement_organs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "announcement_id"
    t.uuid "organ_id"
    t.integer "notifications_count"
    t.string "state"
    t.datetime "announce_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_notice_announcement_organs_on_announcement_id"
    t.index ["organ_id"], name: "index_notice_announcement_organs_on_organ_id"
  end

  create_table "notice_announcement_user_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "announcement_id"
    t.uuid "user_tag_id"
    t.integer "notifications_count"
    t.string "state"
    t.datetime "announce_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_notice_announcement_user_tags_on_announcement_id"
    t.index ["user_tag_id"], name: "index_notice_announcement_user_tags_on_user_tag_id"
  end

  create_table "notice_announcements", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "publisher_type"
    t.uuid "publisher_id"
    t.string "type"
    t.string "title"
    t.string "body"
    t.string "link"
    t.integer "notifications_count"
    t.integer "readed_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_notice_announcements_on_organ_id"
    t.index ["publisher_type", "publisher_id"], name: "index_notice_announcements_on_publisher"
  end

  create_table "notice_notification_sendings", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "notification_id"
    t.string "way"
    t.string "sent_to"
    t.datetime "sent_at"
    t.string "sent_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_id"], name: "index_notice_notification_sendings_on_notification_id"
  end

  create_table "notice_notifications", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "sender_type"
    t.uuid "sender_id"
    t.string "notifiable_type"
    t.uuid "notifiable_id"
    t.string "linked_type"
    t.uuid "linked_id"
    t.string "type"
    t.string "state"
    t.string "title"
    t.string "body"
    t.string "link"
    t.datetime "sending_at"
    t.datetime "read_at"
    t.string "code"
    t.boolean "official"
    t.boolean "archived"
    t.boolean "verbose"
    t.datetime "created_at", null: false
    t.integer "receiver_id"
    t.index ["created_at"], name: "index_notice_notifications_on_created_at"
    t.index ["linked_type", "linked_id"], name: "index_notice_notifications_on_linked"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notice_notifications_on_notifiable"
    t.index ["organ_id"], name: "index_notice_notifications_on_organ_id"
    t.index ["read_at"], name: "index_notice_notifications_on_read_at"
    t.index ["receiver_id"], name: "index_notice_notifications_on_receiver_id"
    t.index ["sender_type", "sender_id"], name: "index_notice_notifications_on_sender"
  end

  create_table "one_ai_app_models", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "app_id"
    t.string "name"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_one_ai_app_models_on_app_id"
  end

  create_table "one_ai_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "type"
    t.string "name"
    t.string "appid"
    t.string "secret"
    t.string "base_url"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_one_ai_apps_on_appid"
    t.index ["organ_id"], name: "index_one_ai_apps_on_organ_id"
  end

  create_table "one_ai_chats", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "one_ai_messages", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "chat_id"
    t.string "type"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_one_ai_messages_on_chat_id"
  end

  create_table "one_ai_system_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "system_id"
    t.uuid "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_one_ai_system_apps_on_app_id"
    t.index ["system_id"], name: "index_one_ai_system_apps_on_system_id"
  end

  create_table "one_ai_systems", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "org_department_grants", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "organ_handle_id"
    t.uuid "department_id"
    t.uuid "job_title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_org_department_grants_on_department_id"
    t.index ["job_title_id"], name: "index_org_department_grants_on_job_title_id"
    t.index ["organ_handle_id"], name: "index_org_department_grants_on_organ_handle_id"
    t.index ["organ_id"], name: "index_org_department_grants_on_organ_id"
  end

  create_table "org_department_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "org/department_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_org_department_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_org_department_hierarchies_on_descendant_id"
  end

  create_table "org_departments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.uuid "organ_id"
    t.uuid "superior_id"
    t.jsonb "parent_ancestors"
    t.string "name"
    t.integer "needed_number"
    t.integer "member_departments_count"
    t.integer "all_member_departments_count"
    t.jsonb "superior_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_org_departments_on_organ_id"
    t.index ["parent_id"], name: "index_org_departments_on_parent_id"
    t.index ["superior_id"], name: "index_org_departments_on_superior_id"
  end

  create_table "org_job_titles", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "department_id"
    t.uuid "department_root_id"
    t.uuid "super_job_title_id"
    t.integer "grade"
    t.integer "super_grade"
    t.string "name"
    t.string "description"
    t.integer "limit_member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_org_job_titles_on_department_id"
    t.index ["department_root_id"], name: "index_org_job_titles_on_department_root_id"
    t.index ["super_job_title_id"], name: "index_org_job_titles_on_super_job_title_id"
  end

  create_table "org_job_transfers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "to_department_id"
    t.uuid "to_job_title_id"
    t.uuid "from_department_id"
    t.uuid "from_job_title_id"
    t.string "state"
    t.date "transfer_on"
    t.string "reason_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_department_id"], name: "index_org_job_transfers_on_from_department_id"
    t.index ["from_job_title_id"], name: "index_org_job_transfers_on_from_job_title_id"
    t.index ["member_id"], name: "index_org_job_transfers_on_member_id"
    t.index ["to_department_id"], name: "index_org_job_transfers_on_to_department_id"
    t.index ["to_job_title_id"], name: "index_org_job_transfers_on_to_job_title_id"
  end

  create_table "org_member_departments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "department_id"
    t.uuid "job_title_id"
    t.jsonb "department_ancestors"
    t.integer "department_root_id"
    t.integer "superior_id"
    t.integer "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_org_member_departments_on_department_id"
    t.index ["job_title_id"], name: "index_org_member_departments_on_job_title_id"
    t.index ["member_id"], name: "index_org_member_departments_on_member_id"
  end

  create_table "org_members", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "cache_id"
    t.uuid "member_inviter_id"
    t.string "identity"
    t.string "experience"
    t.string "attendance_number"
    t.integer "organ_root_id"
    t.string "name"
    t.string "number"
    t.date "join_on"
    t.boolean "enabled"
    t.boolean "inviter"
    t.boolean "own"
    t.string "state"
    t.jsonb "department_ancestors"
    t.integer "pomodoro"
    t.integer "maintains_count"
    t.integer "promote_goods_count"
    t.string "notifiable_types"
    t.jsonb "counters"
    t.integer "showtime"
    t.boolean "accept_email"
    t.string "corp_userid"
    t.string "wechat_openid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cache_id"], name: "index_org_members_on_cache_id"
    t.index ["identity"], name: "index_org_members_on_identity"
    t.index ["member_inviter_id"], name: "index_org_members_on_member_inviter_id"
    t.index ["organ_id"], name: "index_org_members_on_organ_id"
  end

  create_table "org_organ_domains", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "subdomain"
    t.string "domain"
    t.string "host"
    t.boolean "default"
    t.string "beian", comment: "备案号"
    t.string "redirect_controller"
    t.string "redirect_action", comment: "默认跳转"
    t.string "scheme"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host"], name: "index_org_organ_domains_on_host"
    t.index ["organ_id"], name: "index_org_organ_domains_on_organ_id"
  end

  create_table "org_organ_handles", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "record_class"
    t.string "record_column"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "org_organ_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "org/organ_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_org_organ_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_org_organ_hierarchies_on_descendant_id"
  end

  create_table "org_organs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "area_id"
    t.uuid "creator_id"
    t.uuid "provider_id"
    t.uuid "parent_id"
    t.uuid "cache_id"
    t.uuid "corp_user_id"
    t.string "name"
    t.string "name_short"
    t.string "address"
    t.boolean "official", comment: "是否官方"
    t.boolean "joinable", comment: "是否可搜索并加入"
    t.string "code"
    t.string "license"
    t.string "service_url", comment: "客服 url"
    t.jsonb "theme_settings"
    t.integer "members_count"
    t.jsonb "area_ancestors"
    t.jsonb "parent_ancestors"
    t.string "dispatch"
    t.boolean "production_enabled"
    t.jsonb "factory_settings"
    t.integer "limit_wechat"
    t.integer "limit_wechat_menu"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_org_organs_on_area_id"
    t.index ["cache_id"], name: "index_org_organs_on_cache_id"
    t.index ["corp_user_id"], name: "index_org_organs_on_corp_user_id"
    t.index ["creator_id"], name: "index_org_organs_on_creator_id"
    t.index ["parent_id"], name: "index_org_organs_on_parent_id"
    t.index ["provider_id"], name: "index_org_organs_on_provider_id"
  end

  create_table "org_resign_reasons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "resigns_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "org_resign_references", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "resign_id"
    t.uuid "resign_reason_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resign_id"], name: "index_org_resign_references_on_resign_id"
    t.index ["resign_reason_id"], name: "index_org_resign_references_on_resign_reason_id"
  end

  create_table "org_resigns", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.date "leave_on"
    t.string "reason_note"
    t.string "handover_note"
    t.string "comment"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_org_resigns_on_member_id"
  end

  create_table "org_shortcuts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.string "controller"
    t.string "action"
    t.string "business"
    t.string "namespace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_org_shortcuts_on_member_id"
  end

  create_table "org_super_job_titles", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.integer "grade"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_org_super_job_titles_on_organ_id"
  end

  create_table "org_supports", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "department_id"
    t.uuid "organ_id"
    t.uuid "supporter_id"
    t.string "name"
    t.integer "grade"
    t.string "code"
    t.jsonb "department_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_org_supports_on_department_id"
    t.index ["member_id"], name: "index_org_supports_on_member_id"
    t.index ["organ_id"], name: "index_org_supports_on_organ_id"
    t.index ["supporter_id"], name: "index_org_supports_on_supporter_id"
  end

  create_table "org_tutorials", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_id"
    t.uuid "tutor_id"
    t.string "state"
    t.string "accepted_status"
    t.string "verified"
    t.string "kind"
    t.date "start_on"
    t.date "finish_on"
    t.string "performance"
    t.integer "allowance"
    t.string "note"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_org_tutorials_on_member_id"
    t.index ["tutor_id"], name: "index_org_tutorials_on_tutor_id"
  end

  create_table "print_devices", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "printer_type"
    t.uuid "printer_id"
    t.string "aim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_print_devices_on_organ_id"
    t.index ["printer_type", "printer_id"], name: "index_print_devices_on_printer"
  end

  create_table "print_jia_bo_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "member_code"
    t.string "api_key"
    t.integer "jia_bo_printers_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "print_jia_bo_printers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "jia_bo_app_id"
    t.string "device_id"
    t.string "dev_name"
    t.string "grp_id"
    t.string "dev_id"
    t.boolean "online"
    t.string "cmd_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jia_bo_app_id"], name: "index_print_jia_bo_printers_on_jia_bo_app_id"
    t.index ["organ_id"], name: "index_print_jia_bo_printers_on_organ_id"
  end

  create_table "print_mqtt_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "key"
    t.string "secret"
    t.string "base_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "print_printers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.index ["organ_id"], name: "index_print_printers_on_organ_id"
  end

  create_table "roled_cache_roles", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "role_id"
    t.uuid "cache_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cache_id"], name: "index_roled_cache_roles_on_cache_id"
    t.index ["role_id"], name: "index_roled_cache_roles_on_role_id"
  end

  create_table "roled_caches", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "str_role_ids"
    t.jsonb "role_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["str_role_ids"], name: "index_roled_caches_on_str_role_ids"
  end

  create_table "roled_role_rules", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "role_id"
    t.uuid "meta_action_id"
    t.string "business_identifier"
    t.string "namespace_identifier"
    t.string "controller_path"
    t.string "action_name"
    t.string "params_name"
    t.string "params_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meta_action_id"], name: "index_roled_role_rules_on_meta_action_id"
    t.index ["role_id"], name: "index_roled_role_rules_on_role_id"
  end

  create_table "roled_role_types", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "role_id"
    t.string "who_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roled_role_types_on_role_id"
  end

  create_table "roled_role_whos", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "role_id"
    t.string "who_type"
    t.uuid "who_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roled_role_whos_on_role_id"
    t.index ["who_type", "who_id"], name: "index_roled_role_whos_on_who"
  end

  create_table "roled_roles", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.string "tip"
    t.string "description"
    t.boolean "visible"
    t.jsonb "role_hash"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_roled_roles_on_organ_id"
  end

  create_table "roled_tabs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "role_id"
    t.string "name"
    t.string "path"
    t.string "icon"
    t.integer "position"
    t.string "namespace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roled_tabs_on_role_id"
  end

  create_table "ship_address_uses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "address_id"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_ship_address_uses_on_address_id"
  end

  create_table "ship_addresses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "area_id"
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "station_id"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.uuid "agent_id"
    t.string "name"
    t.string "detail"
    t.string "contact_person"
    t.string "tel"
    t.string "post_code"
    t.string "source"
    t.string "cached_key"
    t.boolean "principal"
    t.jsonb "area_ancestors"
    t.string "floor", comment: "楼层"
    t.string "room", comment: "房间号"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_ship_addresses_on_agent_id"
    t.index ["area_id"], name: "index_ship_addresses_on_area_id"
    t.index ["client_id"], name: "index_ship_addresses_on_client_id"
    t.index ["contact_id"], name: "index_ship_addresses_on_contact_id"
    t.index ["member_id"], name: "index_ship_addresses_on_member_id"
    t.index ["member_organ_id"], name: "index_ship_addresses_on_member_organ_id"
    t.index ["organ_id"], name: "index_ship_addresses_on_organ_id"
    t.index ["station_id"], name: "index_ship_addresses_on_station_id"
    t.index ["user_id"], name: "index_ship_addresses_on_user_id"
  end

  create_table "ship_area_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "ship/area_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_ship_area_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_ship_area_hierarchies_on_descendant_id"
  end

  create_table "ship_areas", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.string "name"
    t.string "full"
    t.boolean "published"
    t.boolean "popular"
    t.string "names", array: true
    t.string "timezone"
    t.string "locale"
    t.string "code"
    t.jsonb "parent_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_ship_areas_on_parent_id"
  end

  create_table "ship_box_holds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "box_specification_id"
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.integer "boxes_count"
    t.integer "rented_amount"
    t.integer "owned_amount"
    t.integer "box_host_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_specification_id"], name: "index_ship_box_holds_on_box_specification_id"
    t.index ["member_id"], name: "index_ship_box_holds_on_member_id"
    t.index ["member_organ_id"], name: "index_ship_box_holds_on_member_organ_id"
    t.index ["organ_id"], name: "index_ship_box_holds_on_organ_id"
    t.index ["user_id"], name: "index_ship_box_holds_on_user_id"
  end

  create_table "ship_box_hosts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "box_specification_id"
    t.integer "boxes_count"
    t.integer "tradable_count", comment: "可交易数量，可租亦可卖"
    t.virtual "traded_count", type: :integer, as: "(boxes_count - tradable_count)", stored: true
    t.integer "rent_charges_count"
    t.string "rent_unit"
    t.string "name"
    t.string "sku"
    t.decimal "price"
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.jsonb "wallet_price"
    t.jsonb "extra"
    t.string "unit"
    t.decimal "quantity"
    t.decimal "unified_quantity"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.string "good_type"
    t.decimal "step", comment: "Item Number Step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_specification_id"], name: "index_ship_box_hosts_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_hosts_on_organ_id"
  end

  create_table "ship_box_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "box_id"
    t.string "boxed_type"
    t.uuid "boxed_id"
    t.datetime "boxed_in_at"
    t.datetime "boxed_out_at"
    t.integer "duration"
    t.string "confirm_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_ship_box_logs_on_box_id"
    t.index ["boxed_type", "boxed_id"], name: "index_ship_box_logs_on_boxed"
  end

  create_table "ship_box_proxy_buys", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "box_specification_id"
    t.uuid "box_host_id"
    t.integer "buyable_count"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_host_id"], name: "index_ship_box_proxy_buys_on_box_host_id"
    t.index ["box_specification_id"], name: "index_ship_box_proxy_buys_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_proxy_buys_on_organ_id"
  end

  create_table "ship_box_proxy_sells", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "box_specification_id"
    t.uuid "organ_id"
    t.integer "sellable_count"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_specification_id"], name: "index_ship_box_proxy_sells_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_proxy_sells_on_organ_id"
  end

  create_table "ship_box_sells", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "box_specification_id"
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.decimal "price"
    t.integer "amount"
    t.integer "done_amount"
    t.integer "rest_amount"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_specification_id"], name: "index_ship_box_sells_on_box_specification_id"
    t.index ["member_id"], name: "index_ship_box_sells_on_member_id"
    t.index ["member_organ_id"], name: "index_ship_box_sells_on_member_organ_id"
    t.index ["organ_id"], name: "index_ship_box_sells_on_organ_id"
    t.index ["user_id"], name: "index_ship_box_sells_on_user_id"
  end

  create_table "ship_box_specifications", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.integer "width"
    t.integer "length"
    t.integer "height"
    t.integer "boxes_count"
    t.string "unit"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ship_boxes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "box_specification_id"
    t.string "code"
    t.integer "shipment_items_count"
    t.integer "box_logs_count"
    t.string "status"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_specification_id"], name: "index_ship_boxes_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_boxes_on_organ_id"
  end

  create_table "ship_car_drivers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "car_id"
    t.uuid "driver_id"
    t.jsonb "repeat_days"
    t.string "event_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_ship_car_drivers_on_car_id"
    t.index ["driver_id"], name: "index_ship_car_drivers_on_driver_id"
  end

  create_table "ship_cars", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.string "brand", comment: "车品牌"
    t.string "location"
    t.string "number", comment: "车牌号"
    t.string "tel", comment: "随车电话"
    t.jsonb "detail"
    t.string "carriage"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_ship_cars_on_organ_id"
    t.index ["user_id"], name: "index_ship_cars_on_user_id"
  end

  create_table "ship_drivers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "member_id"
    t.string "name"
    t.string "number"
    t.jsonb "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_ship_drivers_on_member_id"
    t.index ["organ_id"], name: "index_ship_drivers_on_organ_id"
    t.index ["user_id"], name: "index_ship_drivers_on_user_id"
  end

  create_table "ship_favorites", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "driver_id"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_ship_favorites_on_driver_id"
    t.index ["user_id"], name: "index_ship_favorites_on_user_id"
  end

  create_table "ship_line_similars", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "line_id"
    t.uuid "similar_id"
    t.decimal "score"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_ship_line_similars_on_line_id"
    t.index ["similar_id"], name: "index_ship_line_similars_on_similar_id"
  end

  create_table "ship_line_stations", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "line_id"
    t.uuid "station_id"
    t.integer "position"
    t.integer "expected_minutes", comment: "预计到下站分钟数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_ship_line_stations_on_line_id"
    t.index ["organ_id"], name: "index_ship_line_stations_on_organ_id"
    t.index ["station_id"], name: "index_ship_line_stations_on_station_id"
  end

  create_table "ship_lines", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "start_name"
    t.string "finish_name"
    t.integer "line_stations_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ship_locations", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "area_id"
    t.uuid "way_id"
    t.uuid "station_id"
    t.string "name"
    t.integer "position"
    t.string "poiname"
    t.string "poiaddress"
    t.string "cityname"
    t.decimal "lat"
    t.decimal "lng"
    t.point "coordinate"
    t.jsonb "area_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_ship_locations_on_area_id"
    t.index ["station_id"], name: "index_ship_locations_on_station_id"
    t.index ["way_id"], name: "index_ship_locations_on_way_id"
  end

  create_table "ship_packageds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "trade_item_id"
    t.string "good_item_type"
    t.uuid "good_item_id"
    t.uuid "package_id"
    t.string "trade_item_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_item_type", "good_item_id"], name: "index_ship_packageds_on_good_item"
    t.index ["package_id"], name: "index_ship_packageds_on_package_id"
    t.index ["trade_item_id"], name: "index_ship_packageds_on_trade_item_id"
  end

  create_table "ship_packages", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "produce_plan_id"
    t.uuid "from_station_id"
    t.uuid "from_address_id"
    t.uuid "station_id"
    t.uuid "address_id"
    t.uuid "box_id"
    t.uuid "current_shipment_id"
    t.string "state"
    t.date "expected_on"
    t.string "pick_mode"
    t.string "confirm_mode"
    t.datetime "boxed_in_at"
    t.datetime "boxed_out_at"
    t.integer "packageds_count"
    t.integer "shipment_items_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_ship_packages_on_address_id"
    t.index ["box_id"], name: "index_ship_packages_on_box_id"
    t.index ["current_shipment_id"], name: "index_ship_packages_on_current_shipment_id"
    t.index ["from_address_id"], name: "index_ship_packages_on_from_address_id"
    t.index ["from_station_id"], name: "index_ship_packages_on_from_station_id"
    t.index ["organ_id"], name: "index_ship_packages_on_organ_id"
    t.index ["produce_plan_id"], name: "index_ship_packages_on_produce_plan_id"
    t.index ["station_id"], name: "index_ship_packages_on_station_id"
    t.index ["user_id"], name: "index_ship_packages_on_user_id"
  end

  create_table "ship_shipment_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "loaded_station_id"
    t.uuid "unloaded_station_id"
    t.uuid "shipment_id"
    t.uuid "package_id"
    t.uuid "station_id"
    t.uuid "box_id"
    t.datetime "loaded_at"
    t.datetime "unloaded_at"
    t.string "confirm_mode"
    t.string "state"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_ship_shipment_items_on_box_id"
    t.index ["loaded_station_id"], name: "index_ship_shipment_items_on_loaded_station_id"
    t.index ["package_id"], name: "index_ship_shipment_items_on_package_id"
    t.index ["shipment_id"], name: "index_ship_shipment_items_on_shipment_id"
    t.index ["station_id"], name: "index_ship_shipment_items_on_station_id"
    t.index ["unloaded_station_id"], name: "index_ship_shipment_items_on_unloaded_station_id"
  end

  create_table "ship_shipment_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "shipment_id"
    t.uuid "station_id"
    t.datetime "expected_leave_at"
    t.datetime "left_at"
    t.datetime "arrived_at"
    t.datetime "prepared_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_ship_shipment_logs_on_shipment_id"
    t.index ["station_id"], name: "index_ship_shipment_logs_on_station_id"
  end

  create_table "ship_shipments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "line_id"
    t.uuid "car_id"
    t.uuid "driver_id"
    t.uuid "current_line_station_id"
    t.string "shipping_type"
    t.uuid "shipping_id"
    t.string "type"
    t.datetime "expected_leave_at"
    t.datetime "expected_arrive_at"
    t.datetime "left_at"
    t.datetime "arrived_at"
    t.date "load_on"
    t.integer "shipment_items_count"
    t.integer "expected_minutes", comment: "预计路途分钟数"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_ship_shipments_on_car_id"
    t.index ["current_line_station_id"], name: "index_ship_shipments_on_current_line_station_id"
    t.index ["driver_id"], name: "index_ship_shipments_on_driver_id"
    t.index ["line_id"], name: "index_ship_shipments_on_line_id"
    t.index ["organ_id"], name: "index_ship_shipments_on_organ_id"
    t.index ["shipping_type", "shipping_id"], name: "index_ship_shipments_on_shipping"
  end

  create_table "ship_ways", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "line_id"
    t.string "name"
    t.string "start_name"
    t.string "finish_name"
    t.integer "locations_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_ship_ways_on_line_id"
    t.index ["organ_id"], name: "index_ship_ways_on_organ_id"
    t.index ["user_id"], name: "index_ship_ways_on_user_id"
  end

  create_table "space_buildings", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "station_id"
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_space_buildings_on_station_id"
  end

  create_table "space_desks", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "room_id"
    t.uuid "organ_id"
    t.string "name"
    t.string "code"
    t.integer "width"
    t.integer "height"
    t.integer "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_space_desks_on_organ_id"
    t.index ["room_id"], name: "index_space_desks_on_room_id"
  end

  create_table "space_grids", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "room_id"
    t.string "name"
    t.string "code"
    t.integer "width"
    t.integer "height"
    t.integer "length"
    t.integer "floor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_space_grids_on_room_id"
  end

  create_table "space_rooms", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "station_id"
    t.uuid "building_id"
    t.uuid "organ_id"
    t.string "name"
    t.string "code"
    t.integer "floor"
    t.integer "grids_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_space_rooms_on_building_id"
    t.index ["organ_id"], name: "index_space_rooms_on_organ_id"
    t.index ["station_id"], name: "index_space_rooms_on_station_id"
  end

  create_table "space_stations", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "area_id"
    t.string "name"
    t.string "code"
    t.string "detail"
    t.integer "buildings_count"
    t.integer "rooms_count"
    t.jsonb "area_ancestors"
    t.string "poiname"
    t.string "poiaddress"
    t.string "cityname"
    t.decimal "lat"
    t.decimal "lng"
    t.point "coordinate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_space_stations_on_area_id"
    t.index ["organ_id"], name: "index_space_stations_on_organ_id"
  end

  create_table "statis_configs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "statistical_type"
    t.date "begin_on"
    t.date "end_on"
    t.string "note"
    t.jsonb "scopes"
    t.jsonb "keys"
    t.jsonb "sums"
    t.date "today"
    t.integer "today_begin_id"
    t.integer "counter_years_count"
    t.integer "counter_months_count"
    t.integer "counter_days_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statis_counter_days", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "config_id"
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.string "year_month"
    t.date "date"
    t.integer "count"
    t.jsonb "filter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["config_id"], name: "index_statis_counter_days_on_config_id"
    t.index ["year_month"], name: "index_statis_counter_days_on_year_month"
  end

  create_table "statis_counter_months", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "config_id"
    t.integer "year"
    t.integer "month"
    t.string "year_month"
    t.integer "count"
    t.jsonb "filter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["config_id"], name: "index_statis_counter_months_on_config_id"
    t.index ["year_month"], name: "index_statis_counter_months_on_year_month"
  end

  create_table "statis_counter_years", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "config_id"
    t.integer "year"
    t.date "begin_on"
    t.integer "count"
    t.jsonb "filter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["config_id"], name: "index_statis_counter_years_on_config_id"
  end

  create_table "statis_statistic_days", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "statistic_id"
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.string "year_month"
    t.date "date"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["statistic_id"], name: "index_statis_statistic_days_on_statistic_id"
    t.index ["year_month"], name: "index_statis_statistic_days_on_year_month"
  end

  create_table "statis_statistic_months", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "statistic_id"
    t.integer "year"
    t.integer "month"
    t.string "year_month"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["statistic_id"], name: "index_statis_statistic_months_on_statistic_id"
    t.index ["year_month"], name: "index_statis_statistic_months_on_year_month"
  end

  create_table "statis_statistic_years", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "statistic_id"
    t.integer "year"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["statistic_id"], name: "index_statis_statistic_years_on_statistic_id"
  end

  create_table "statis_statistics", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "statistical_type"
    t.string "column"
    t.jsonb "extra"
    t.string "value"
    t.boolean "cached"
    t.integer "statistic_years_count"
    t.integer "statistic_months_count"
    t.integer "statistic_days_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stats", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.date "date"
    t.integer "subscribed_requests_count"
    t.integer "oauth_users_count"
    t.integer "users_count"
    t.integer "requirements_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sync_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "type"
    t.string "name"
    t.string "appid"
    t.string "secret"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "refresh_token"
    t.datetime "refresh_token_expires_at"
    t.string "base_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_sync_apps_on_appid"
    t.index ["organ_id"], name: "index_sync_apps_on_organ_id"
  end

  create_table "sync_audits", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "synchro_type"
    t.uuid "synchro_id"
    t.string "operator_type"
    t.uuid "operator_id"
    t.uuid "destined_id"
    t.jsonb "synchro_params"
    t.jsonb "audited_changes"
    t.string "operation"
    t.string "note"
    t.string "state"
    t.datetime "apply_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destined_id"], name: "index_sync_audits_on_destined_id"
    t.index ["operator_type", "operator_id"], name: "index_sync_audits_on_operator"
    t.index ["synchro_type", "synchro_id"], name: "index_sync_audits_on_synchro"
  end

  create_table "sync_form_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "sync/form_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_sync_form_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_sync_form_hierarchies_on_descendant_id"
  end

  create_table "sync_forms", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.uuid "organ_id"
    t.uuid "record_id"
    t.uuid "meta_column_id"
    t.jsonb "parent_ancestors"
    t.string "name"
    t.string "column_name"
    t.string "record_name"
    t.string "external_column_name"
    t.string "external_record_name"
    t.boolean "display"
    t.boolean "primary"
    t.boolean "modeling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meta_column_id"], name: "index_sync_forms_on_meta_column_id"
    t.index ["organ_id"], name: "index_sync_forms_on_organ_id"
    t.index ["parent_id"], name: "index_sync_forms_on_parent_id"
    t.index ["record_id"], name: "index_sync_forms_on_record_id"
  end

  create_table "sync_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "record_id"
    t.string "identifier"
    t.jsonb "values"
    t.integer "logs_count"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_sync_items_on_identifier"
    t.index ["organ_id"], name: "index_sync_items_on_organ_id"
    t.index ["record_id"], name: "index_sync_items_on_record_id"
  end

  create_table "sync_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "item_id"
    t.string "related_type"
    t.uuid "related_id"
    t.string "exception"
    t.jsonb "exception_backtrace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_sync_logs_on_item_id"
    t.index ["related_type", "related_id"], name: "index_sync_logs_on_related"
  end

  create_table "sync_records", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "app_id"
    t.string "name"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_sync_records_on_app_id"
    t.index ["organ_id"], name: "index_sync_records_on_organ_id"
  end

  create_table "trade_addition_charges", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "addition_id"
    t.decimal "min"
    t.decimal "max"
    t.decimal "filter_min"
    t.decimal "filter_max"
    t.boolean "contain_min"
    t.boolean "contain_max"
    t.decimal "parameter"
    t.jsonb "wallet_price"
    t.decimal "base_price"
    t.jsonb "wallet_base_price"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addition_id"], name: "index_trade_addition_charges_on_addition_id"
  end

  create_table "trade_additions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "deal_type"
    t.uuid "deal_id"
    t.string "name"
    t.string "short_name"
    t.string "code"
    t.string "unit_code"
    t.string "description"
    t.string "metering"
    t.boolean "editable", comment: "是否可更改价格"
    t.boolean "verified"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_type", "deal_id"], name: "index_trade_additions_on_deal"
    t.index ["organ_id"], name: "index_trade_additions_on_organ_id"
  end

  create_table "trade_advances", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "wallet_template_id"
    t.uuid "card_template_id"
    t.string "name"
    t.string "sku"
    t.decimal "price"
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.jsonb "wallet_price"
    t.jsonb "extra"
    t.string "unit"
    t.decimal "quantity"
    t.decimal "unified_quantity"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.string "good_type"
    t.decimal "step", comment: "Item Number Step"
    t.decimal "amount"
    t.string "apple_product_id", comment: "For 苹果应用内支付"
    t.boolean "open"
    t.boolean "lawful", comment: "是否法币"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_template_id"], name: "index_trade_advances_on_card_template_id"
    t.index ["organ_id"], name: "index_trade_advances_on_organ_id"
    t.index ["wallet_template_id"], name: "index_trade_advances_on_wallet_template_id"
  end

  create_table "trade_card_purchases", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "card_id"
    t.uuid "purchase_id"
    t.uuid "item_id"
    t.decimal "price"
    t.integer "days"
    t.integer "months"
    t.integer "years"
    t.string "note"
    t.datetime "last_expire_at"
    t.string "kind"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_trade_card_purchases_on_card_id"
    t.index ["item_id"], name: "index_trade_card_purchases_on_item_id"
    t.index ["purchase_id"], name: "index_trade_card_purchases_on_purchase_id"
  end

  create_table "trade_card_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "promote_id"
    t.uuid "parent_id"
    t.string "name"
    t.string "description"
    t.string "text_color"
    t.integer "cards_count"
    t.string "code"
    t.integer "grade", comment: "会员级别"
    t.boolean "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_trade_card_templates_on_organ_id"
    t.index ["parent_id"], name: "index_trade_card_templates_on_parent_id"
    t.index ["promote_id"], name: "index_trade_card_templates_on_promote_id"
  end

  create_table "trade_cards", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "card_template_id"
    t.uuid "agency_id"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.uuid "agent_id"
    t.string "card_uuid"
    t.datetime "effect_at"
    t.datetime "expire_at"
    t.boolean "temporary", comment: "在购物车勾选临时生效"
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_trade_cards_on_agency_id"
    t.index ["agent_id"], name: "index_trade_cards_on_agent_id"
    t.index ["card_template_id"], name: "index_trade_cards_on_card_template_id"
    t.index ["client_id"], name: "index_trade_cards_on_client_id"
    t.index ["contact_id"], name: "index_trade_cards_on_contact_id"
    t.index ["member_id"], name: "index_trade_cards_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_cards_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_cards_on_organ_id"
    t.index ["user_id"], name: "index_trade_cards_on_user_id"
  end

  create_table "trade_cart_promotes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "cart_id"
    t.uuid "order_id"
    t.uuid "promote_id"
    t.uuid "promote_charge_id"
    t.string "promote_name"
    t.integer "sequence"
    t.decimal "value"
    t.decimal "original_amount", comment: "初始价格"
    t.decimal "based_amount", comment: "基于此价格计算，默认为 item 的 amount，与sequence有关"
    t.decimal "computed_amount", comment: "计算出的价格"
    t.jsonb "unit_prices"
    t.decimal "amount", comment: "默认等于 computed_amount，如果客服人员修改过价格后，则 amount 会发生变化"
    t.string "note", comment: "备注"
    t.boolean "edited", comment: "是否被客服改过价"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_trade_cart_promotes_on_cart_id"
    t.index ["order_id"], name: "index_trade_cart_promotes_on_order_id"
    t.index ["organ_id"], name: "index_trade_cart_promotes_on_organ_id"
    t.index ["promote_charge_id"], name: "index_trade_cart_promotes_on_promote_charge_id"
    t.index ["promote_id"], name: "index_trade_cart_promotes_on_promote_id"
  end

  create_table "trade_carts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "address_id"
    t.uuid "payment_strategy_id"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.uuid "agent_id"
    t.uuid "desk_id"
    t.uuid "station_id"
    t.decimal "item_amount"
    t.decimal "overall_additional_amount"
    t.decimal "overall_reduced_amount"
    t.decimal "original_amount", comment: "原价，应用优惠之前的价格"
    t.decimal "amount"
    t.decimal "advance_amount"
    t.jsonb "extra"
    t.integer "lock_version"
    t.string "good_type"
    t.decimal "retail_price", comment: "汇总：原价"
    t.decimal "discount_price", comment: "汇总：优惠"
    t.decimal "bulk_price"
    t.decimal "total_quantity"
    t.integer "deposit_ratio", comment: "最小预付比例"
    t.boolean "auto", comment: "自动下单"
    t.boolean "fresh"
    t.boolean "purchasable"
    t.integer "items_count"
    t.string "aim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_trade_carts_on_address_id"
    t.index ["agent_id"], name: "index_trade_carts_on_agent_id"
    t.index ["client_id"], name: "index_trade_carts_on_client_id"
    t.index ["contact_id"], name: "index_trade_carts_on_contact_id"
    t.index ["desk_id"], name: "index_trade_carts_on_desk_id"
    t.index ["member_id"], name: "index_trade_carts_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_carts_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_carts_on_organ_id"
    t.index ["payment_strategy_id"], name: "index_trade_carts_on_payment_strategy_id"
    t.index ["station_id"], name: "index_trade_carts_on_station_id"
    t.index ["user_id"], name: "index_trade_carts_on_user_id"
  end

  create_table "trade_deliveries", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "organ_id"
    t.uuid "scene_id"
    t.uuid "order_id"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.uuid "agent_id"
    t.boolean "fetch_oneself", comment: "自取"
    t.datetime "fetch_start_at"
    t.datetime "fetch_finish_at"
    t.date "produce_on", comment: "对接生产管理"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_trade_deliveries_on_agent_id"
    t.index ["client_id"], name: "index_trade_deliveries_on_client_id"
    t.index ["contact_id"], name: "index_trade_deliveries_on_contact_id"
    t.index ["member_id"], name: "index_trade_deliveries_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_deliveries_on_member_organ_id"
    t.index ["order_id"], name: "index_trade_deliveries_on_order_id"
    t.index ["organ_id"], name: "index_trade_deliveries_on_organ_id"
    t.index ["scene_id"], name: "index_trade_deliveries_on_scene_id"
    t.index ["user_id"], name: "index_trade_deliveries_on_user_id"
  end

  create_table "trade_exchange_rates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_holds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "item_id"
    t.string "rentable_type"
    t.uuid "rentable_id"
    t.decimal "amount"
    t.datetime "rent_start_at"
    t.datetime "rent_finish_at", comment: "实际结束时间"
    t.datetime "rent_present_finish_at", comment: "周期性计费时间"
    t.datetime "rent_estimate_finish_at", comment: "预估结束时间"
    t.integer "rent_duration"
    t.integer "rent_estimate_duration"
    t.jsonb "wallet_amount"
    t.decimal "estimate_amount"
    t.jsonb "estimate_wallet_amount"
    t.decimal "invest_amount", comment: "投资分成"
    t.jsonb "extra"
    t.string "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_trade_holds_on_item_id"
    t.index ["member_id"], name: "index_trade_holds_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_holds_on_member_organ_id"
    t.index ["rentable_type", "rentable_id"], name: "index_trade_holds_on_rentable"
    t.index ["user_id"], name: "index_trade_holds_on_user_id"
  end

  create_table "trade_item_promotes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "item_id"
    t.uuid "promote_good_id"
    t.uuid "promote_id"
    t.uuid "promote_charge_id"
    t.string "promote_name"
    t.decimal "value"
    t.decimal "amount"
    t.decimal "original_amount"
    t.decimal "unit_price"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_trade_item_promotes_on_item_id"
    t.index ["promote_charge_id"], name: "index_trade_item_promotes_on_promote_charge_id"
    t.index ["promote_good_id"], name: "index_trade_item_promotes_on_promote_good_id"
    t.index ["promote_id"], name: "index_trade_item_promotes_on_promote_id"
  end

  create_table "trade_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "address_id"
    t.uuid "operator_id"
    t.uuid "from_station_id"
    t.uuid "from_address_id"
    t.uuid "provide_id"
    t.string "good_type"
    t.uuid "good_id"
    t.uuid "current_cart_id"
    t.uuid "order_id"
    t.uuid "source_id"
    t.uuid "unit_id"
    t.uuid "scene_id"
    t.uuid "desk_id"
    t.uuid "station_id"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.uuid "agent_id"
    t.string "uuid"
    t.string "good_name"
    t.decimal "number", comment: "数量"
    t.decimal "done_number", comment: "已达成交易数量"
    t.virtual "rest_number", type: :decimal, as: "(number - done_number)", stored: true
    t.integer "weight", comment: "重量"
    t.integer "volume", comment: "体积"
    t.string "vip_code"
    t.decimal "single_price", comment: "一份产品的价格"
    t.decimal "additional_amount", comment: "附加服务价格汇总"
    t.decimal "reduced_amount", comment: "已优惠的价格"
    t.decimal "amount", comment: "合计份数之后的价格，商品原价"
    t.jsonb "wallet_amount"
    t.decimal "advance_amount", comment: "预付款"
    t.datetime "expire_at"
    t.string "note"
    t.jsonb "extra"
    t.integer "holds_count"
    t.integer "purchase_items_count"
    t.string "status"
    t.string "delivery_status"
    t.string "dispatch"
    t.string "aim"
    t.string "job_id"
    t.date "produce_on", comment: "对接生产管理"
    t.integer "purchase_id"
    t.string "purchase_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_trade_items_on_address_id"
    t.index ["agent_id"], name: "index_trade_items_on_agent_id"
    t.index ["client_id"], name: "index_trade_items_on_client_id"
    t.index ["contact_id"], name: "index_trade_items_on_contact_id"
    t.index ["current_cart_id"], name: "index_trade_items_on_current_cart_id"
    t.index ["desk_id"], name: "index_trade_items_on_desk_id"
    t.index ["from_address_id"], name: "index_trade_items_on_from_address_id"
    t.index ["from_station_id"], name: "index_trade_items_on_from_station_id"
    t.index ["good_type", "good_id"], name: "index_trade_items_on_good"
    t.index ["member_id"], name: "index_trade_items_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_items_on_member_organ_id"
    t.index ["operator_id"], name: "index_trade_items_on_operator_id"
    t.index ["order_id"], name: "index_trade_items_on_order_id"
    t.index ["organ_id"], name: "index_trade_items_on_organ_id"
    t.index ["provide_id"], name: "index_trade_items_on_provide_id"
    t.index ["scene_id"], name: "index_trade_items_on_scene_id"
    t.index ["source_id"], name: "index_trade_items_on_source_id"
    t.index ["station_id"], name: "index_trade_items_on_station_id"
    t.index ["unit_id"], name: "index_trade_items_on_unit_id"
    t.index ["user_id"], name: "index_trade_items_on_user_id"
  end

  create_table "trade_orders", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "address_id"
    t.uuid "operator_id"
    t.uuid "from_user_id"
    t.uuid "from_member_id"
    t.uuid "from_member_organ_id"
    t.uuid "from_address_id"
    t.uuid "from_station_id"
    t.uuid "produce_plan_id"
    t.uuid "provide_id"
    t.uuid "current_cart_id"
    t.uuid "payment_strategy_id"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.uuid "agent_id"
    t.uuid "desk_id"
    t.uuid "station_id"
    t.decimal "item_amount"
    t.decimal "overall_additional_amount"
    t.decimal "overall_reduced_amount"
    t.decimal "original_amount", comment: "原价，应用优惠之前的价格"
    t.decimal "amount"
    t.decimal "advance_amount"
    t.jsonb "extra"
    t.integer "lock_version"
    t.string "uuid"
    t.string "note"
    t.datetime "expire_at"
    t.integer "serial_number"
    t.string "currency"
    t.integer "deposit_ratio", comment: "最小预付比例"
    t.integer "items_count"
    t.integer "payment_orders_count"
    t.datetime "paid_at"
    t.datetime "pay_deadline_at"
    t.boolean "pay_auto"
    t.decimal "adjust_amount"
    t.decimal "received_amount"
    t.decimal "refunded_amount"
    t.decimal "unreceived_amount"
    t.decimal "payable_amount"
    t.decimal "verifying_amount", comment: "待核销金额"
    t.string "aim"
    t.string "generate_mode"
    t.string "state"
    t.string "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_trade_orders_on_address_id"
    t.index ["agent_id"], name: "index_trade_orders_on_agent_id"
    t.index ["client_id"], name: "index_trade_orders_on_client_id"
    t.index ["contact_id"], name: "index_trade_orders_on_contact_id"
    t.index ["current_cart_id"], name: "index_trade_orders_on_current_cart_id"
    t.index ["desk_id"], name: "index_trade_orders_on_desk_id"
    t.index ["from_address_id"], name: "index_trade_orders_on_from_address_id"
    t.index ["from_member_id"], name: "index_trade_orders_on_from_member_id"
    t.index ["from_member_organ_id"], name: "index_trade_orders_on_from_member_organ_id"
    t.index ["from_station_id"], name: "index_trade_orders_on_from_station_id"
    t.index ["from_user_id"], name: "index_trade_orders_on_from_user_id"
    t.index ["member_id"], name: "index_trade_orders_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_orders_on_member_organ_id"
    t.index ["operator_id"], name: "index_trade_orders_on_operator_id"
    t.index ["organ_id"], name: "index_trade_orders_on_organ_id"
    t.index ["paid_at"], name: "index_trade_orders_on_paid_at"
    t.index ["payment_strategy_id"], name: "index_trade_orders_on_payment_strategy_id"
    t.index ["produce_plan_id"], name: "index_trade_orders_on_produce_plan_id"
    t.index ["provide_id"], name: "index_trade_orders_on_provide_id"
    t.index ["station_id"], name: "index_trade_orders_on_station_id"
    t.index ["user_id"], name: "index_trade_orders_on_user_id"
  end

  create_table "trade_payment_methods", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "creator_id"
    t.string "type"
    t.string "account_name"
    t.string "account_num"
    t.string "bank"
    t.boolean "verified"
    t.boolean "myself"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_trade_payment_methods_on_creator_id"
  end

  create_table "trade_payment_orders", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "order_id"
    t.uuid "payment_id"
    t.decimal "payment_amount"
    t.decimal "order_amount"
    t.string "kind"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_trade_payment_orders_on_order_id"
    t.index ["payment_id"], name: "index_trade_payment_orders_on_payment_id"
  end

  create_table "trade_payment_references", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "payment_method_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_trade_payment_references_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_payment_references_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_payment_references_on_organ_id"
    t.index ["payment_method_id"], name: "index_trade_payment_references_on_payment_method_id"
    t.index ["user_id"], name: "index_trade_payment_references_on_user_id"
  end

  create_table "trade_payment_strategies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.integer "period", comment: "可延期时间，单位天"
    t.boolean "from_pay"
    t.string "strategy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_trade_payment_strategies_on_organ_id"
  end

  create_table "trade_payments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.string "operator_type"
    t.uuid "operator_id"
    t.uuid "payment_method_id"
    t.uuid "wallet_id"
    t.integer "payment_id", comment: "for paypal"
    t.string "appid"
    t.string "type"
    t.string "payment_uuid"
    t.string "pay_status", comment: "记录来自服务商的状态"
    t.string "currency"
    t.decimal "total_amount"
    t.decimal "orders_amount", comment: "订单金额汇总"
    t.decimal "checked_amount", comment: "实际支付汇总"
    t.decimal "adjust_amount"
    t.decimal "fee_amount"
    t.decimal "refunded_amount"
    t.decimal "income_amount", comment: "实际到账"
    t.string "notify_type"
    t.datetime "notified_at"
    t.string "seller_identifier"
    t.string "buyer_identifier"
    t.string "buyer_name"
    t.string "buyer_bank"
    t.string "comment"
    t.boolean "verified", comment: "是否已确认收款"
    t.integer "lock_version"
    t.jsonb "extra"
    t.jsonb "extra_params"
    t.integer "payment_orders_count"
    t.integer "refunds_count"
    t.string "state"
    t.string "pay_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_type", "operator_id"], name: "index_trade_payments_on_operator"
    t.index ["organ_id"], name: "index_trade_payments_on_organ_id"
    t.index ["payment_method_id"], name: "index_trade_payments_on_payment_method_id"
    t.index ["user_id"], name: "index_trade_payments_on_user_id"
    t.index ["wallet_id"], name: "index_trade_payments_on_wallet_id"
  end

  create_table "trade_payouts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "wallet_id"
    t.uuid "operator_id"
    t.string "payable_type"
    t.uuid "payable_id"
    t.string "payout_uuid"
    t.string "type"
    t.decimal "requested_amount"
    t.decimal "actual_amount"
    t.datetime "paid_at"
    t.boolean "advance"
    t.string "account_bank"
    t.string "account_name"
    t.string "account_num"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_id"], name: "index_trade_payouts_on_operator_id"
    t.index ["payable_type", "payable_id"], name: "index_trade_payouts_on_payable"
    t.index ["wallet_id"], name: "index_trade_payouts_on_wallet_id"
  end

  create_table "trade_privileges", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "card_template_id"
    t.uuid "promote_id"
    t.string "name"
    t.integer "amount", comment: "额度"
    t.decimal "price", comment: "价格"
    t.string "code"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_template_id"], name: "index_trade_privileges_on_card_template_id"
    t.index ["promote_id"], name: "index_trade_privileges_on_promote_id"
  end

  create_table "trade_promote_charges", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "promote_id"
    t.decimal "min"
    t.decimal "max"
    t.decimal "filter_min"
    t.decimal "filter_max"
    t.boolean "contain_min"
    t.boolean "contain_max"
    t.decimal "parameter"
    t.jsonb "wallet_price"
    t.decimal "base_price"
    t.jsonb "wallet_base_price"
    t.jsonb "extra"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promote_id"], name: "index_trade_promote_charges_on_promote_id"
  end

  create_table "trade_promote_extras", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "promote_id"
    t.string "extra_name"
    t.string "column_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promote_id"], name: "index_trade_promote_extras_on_promote_id"
  end

  create_table "trade_promote_goods", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "card_template_id"
    t.uuid "card_id"
    t.uuid "promote_id"
    t.string "good_type"
    t.uuid "good_id"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.uuid "agent_id"
    t.string "status"
    t.datetime "effect_at"
    t.datetime "expire_at"
    t.integer "item_promotes_count"
    t.string "identity"
    t.integer "use_limit"
    t.virtual "over_limit", type: :boolean, as: "(item_promotes_count >= use_limit)", stored: true
    t.integer "blacklists_count"
    t.string "aim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "taxon_id"
    t.uuid "part_id"
    t.index ["agent_id"], name: "index_trade_promote_goods_on_agent_id"
    t.index ["card_id"], name: "index_trade_promote_goods_on_card_id"
    t.index ["card_template_id"], name: "index_trade_promote_goods_on_card_template_id"
    t.index ["client_id"], name: "index_trade_promote_goods_on_client_id"
    t.index ["contact_id"], name: "index_trade_promote_goods_on_contact_id"
    t.index ["good_type", "good_id"], name: "index_trade_promote_goods_on_good"
    t.index ["member_id"], name: "index_trade_promote_goods_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_promote_goods_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_promote_goods_on_organ_id"
    t.index ["part_id"], name: "index_trade_promote_goods_on_part_id"
    t.index ["promote_id"], name: "index_trade_promote_goods_on_promote_id"
    t.index ["taxon_id"], name: "index_trade_promote_goods_on_taxon_id"
    t.index ["user_id"], name: "index_trade_promote_goods_on_user_id"
  end

  create_table "trade_promotes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "deal_type"
    t.uuid "deal_id"
    t.string "name"
    t.string "short_name"
    t.string "code"
    t.string "unit_code"
    t.string "description"
    t.string "metering"
    t.boolean "editable", comment: "是否可更改价格"
    t.jsonb "extra"
    t.integer "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_type", "deal_id"], name: "index_trade_promotes_on_deal"
    t.index ["organ_id"], name: "index_trade_promotes_on_organ_id"
  end

  create_table "trade_purchases", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "card_template_id"
    t.string "name"
    t.string "sku"
    t.decimal "price"
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.jsonb "wallet_price"
    t.jsonb "extra"
    t.string "unit"
    t.decimal "quantity"
    t.decimal "unified_quantity"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.string "good_type"
    t.decimal "step", comment: "Item Number Step"
    t.string "title"
    t.string "note"
    t.integer "years"
    t.integer "months"
    t.integer "days"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_template_id"], name: "index_trade_purchases_on_card_template_id"
  end

  create_table "trade_refund_orders", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "order_id"
    t.uuid "payment_id"
    t.uuid "refund_id"
    t.decimal "payment_amount"
    t.decimal "order_amount", comment: "对应的订单金额"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_trade_refund_orders_on_order_id"
    t.index ["payment_id"], name: "index_trade_refund_orders_on_payment_id"
    t.index ["refund_id"], name: "index_trade_refund_orders_on_refund_id"
  end

  create_table "trade_refunds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "operator_id"
    t.uuid "payment_id"
    t.uuid "wallet_id"
    t.string "type"
    t.string "currency"
    t.decimal "total_amount"
    t.string "buyer_identifier"
    t.string "comment"
    t.datetime "refunded_at"
    t.string "reason"
    t.string "refund_uuid"
    t.jsonb "response"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_id"], name: "index_trade_refunds_on_operator_id"
    t.index ["payment_id"], name: "index_trade_refunds_on_payment_id"
    t.index ["wallet_id"], name: "index_trade_refunds_on_wallet_id"
  end

  create_table "trade_rent_charges", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "rentable_type"
    t.uuid "rentable_id"
    t.integer "min"
    t.integer "max"
    t.integer "filter_min"
    t.integer "filter_max"
    t.boolean "contain_min"
    t.boolean "contain_max"
    t.decimal "parameter"
    t.jsonb "wallet_price"
    t.decimal "base_price"
    t.jsonb "wallet_base_price"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rentable_type", "rentable_id"], name: "index_trade_rent_charges_on_rentable"
  end

  create_table "trade_units", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.boolean "default"
    t.decimal "rate", comment: "相对于默认单位的计算比率"
    t.string "name"
    t.string "code"
    t.string "metering"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_wallet_advances", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "operator_id"
    t.uuid "wallet_id"
    t.uuid "advance_id"
    t.uuid "item_id"
    t.uuid "wallet_prepayment_id"
    t.decimal "price"
    t.decimal "amount"
    t.string "note"
    t.string "kind"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advance_id"], name: "index_trade_wallet_advances_on_advance_id"
    t.index ["item_id"], name: "index_trade_wallet_advances_on_item_id"
    t.index ["operator_id"], name: "index_trade_wallet_advances_on_operator_id"
    t.index ["wallet_id"], name: "index_trade_wallet_advances_on_wallet_id"
    t.index ["wallet_prepayment_id"], name: "index_trade_wallet_advances_on_wallet_prepayment_id"
  end

  create_table "trade_wallet_frozens", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "operator_id"
    t.uuid "wallet_id"
    t.uuid "item_id"
    t.decimal "amount"
    t.string "note"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_trade_wallet_frozens_on_item_id"
    t.index ["operator_id"], name: "index_trade_wallet_frozens_on_operator_id"
    t.index ["wallet_id"], name: "index_trade_wallet_frozens_on_wallet_id"
  end

  create_table "trade_wallet_goods", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "wallet_template_id"
    t.string "good_type"
    t.uuid "good_id"
    t.string "wallet_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_type", "good_id"], name: "index_trade_wallet_goods_on_good"
    t.index ["wallet_template_id"], name: "index_trade_wallet_goods_on_wallet_template_id"
  end

  create_table "trade_wallet_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "wallet_id"
    t.string "source_type"
    t.uuid "source_id"
    t.string "title"
    t.string "tag_str"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_type", "source_id"], name: "index_trade_wallet_logs_on_source"
    t.index ["wallet_id"], name: "index_trade_wallet_logs_on_wallet_id"
  end

  create_table "trade_wallet_prepayments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "wallet_template_id"
    t.string "token"
    t.decimal "amount"
    t.datetime "expire_at"
    t.boolean "lawful"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_template_id"], name: "index_trade_wallet_prepayments_on_wallet_template_id"
  end

  create_table "trade_wallet_sells", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "operator_id"
    t.uuid "wallet_id"
    t.uuid "item_id"
    t.string "selled_type"
    t.uuid "selled_id"
    t.decimal "amount"
    t.string "note"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_trade_wallet_sells_on_item_id"
    t.index ["operator_id"], name: "index_trade_wallet_sells_on_operator_id"
    t.index ["selled_type", "selled_id"], name: "index_trade_wallet_sells_on_selled"
    t.index ["wallet_id"], name: "index_trade_wallet_sells_on_wallet_id"
  end

  create_table "trade_wallet_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "name"
    t.string "description"
    t.string "unit_name"
    t.string "rate", comment: "相对于默认货币的比率"
    t.integer "wallets_count"
    t.string "code"
    t.string "platform"
    t.boolean "enabled"
    t.string "unit"
    t.integer "digit", comment: "精确到小数点后几位"
    t.string "appid", comment: "推广微信公众号"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_trade_wallet_templates_on_organ_id"
  end

  create_table "trade_wallets", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "user_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "wallet_template_id"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.uuid "agent_id"
    t.decimal "withdrawable_amount", comment: "可提现的额度"
    t.string "account_bank"
    t.string "account_name"
    t.string "account_number"
    t.string "type"
    t.string "name"
    t.decimal "amount"
    t.decimal "frozen_amount", comment: "支出：冻结金额"
    t.decimal "payout_amount", comment: "支出：提现"
    t.decimal "payment_amount", comment: "支出：钱包支付"
    t.decimal "refunded_amount", comment: "收入：退款"
    t.decimal "advances_amount", comment: "收入：主动充值"
    t.decimal "sells_amount", comment: "收入：交易入账"
    t.decimal "income_amount"
    t.decimal "expense_amount"
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_trade_wallets_on_agent_id"
    t.index ["client_id"], name: "index_trade_wallets_on_client_id"
    t.index ["contact_id"], name: "index_trade_wallets_on_contact_id"
    t.index ["member_id"], name: "index_trade_wallets_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_wallets_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_wallets_on_organ_id"
    t.index ["user_id"], name: "index_trade_wallets_on_user_id"
    t.index ["wallet_template_id"], name: "index_trade_wallets_on_wallet_template_id"
  end

  create_table "wechat_app_configs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.string "value"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_app_configs_on_appid"
  end

  create_table "wechat_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "platform_id"
    t.uuid "platform_template_id"
    t.integer "auditid"
    t.jsonb "version_info"
    t.jsonb "webview_domain_registered"
    t.string "audit_status"
    t.string "confirm_name"
    t.string "confirm_content"
    t.string "ticket"
    t.string "weapp_id", comment: "关联的小程序"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "jsapi_ticket"
    t.datetime "jsapi_ticket_expires_at"
    t.string "encoding_aes_key"
    t.string "type"
    t.string "appid"
    t.string "platform_appid"
    t.string "refresh_token"
    t.string "func_infos", array: true
    t.string "nick_name"
    t.string "head_img"
    t.string "user_name"
    t.string "principal_name"
    t.string "alias_name"
    t.string "qrcode_url"
    t.jsonb "business_info"
    t.string "service_type"
    t.string "verify_type"
    t.jsonb "extra"
    t.string "logo_media_id"
    t.boolean "enabled"
    t.boolean "global"
    t.string "secret"
    t.string "token"
    t.boolean "encrypt_mode"
    t.string "url_link"
    t.boolean "debug"
    t.string "open_appid"
    t.string "oauth_domain"
    t.string "webview_domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_wechat_apps_on_organ_id"
    t.index ["platform_id"], name: "index_wechat_apps_on_platform_id"
    t.index ["platform_template_id"], name: "index_wechat_apps_on_platform_template_id"
  end

  create_table "wechat_auths", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "platform_id"
    t.uuid "request_id"
    t.string "auth_code"
    t.datetime "auth_code_expires_at"
    t.boolean "testcase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_wechat_auths_on_platform_id"
    t.index ["request_id"], name: "index_wechat_auths_on_request_id"
  end

  create_table "wechat_categories", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.string "name"
    t.integer "level"
    t.string "scope"
    t.string "kind"
    t.jsonb "extra"
    t.jsonb "parent_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_wechat_categories_on_parent_id"
  end

  create_table "wechat_category_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "wechat/category_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_wechat_category_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_wechat_category_hierarchies_on_descendant_id"
  end

  create_table "wechat_contacts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "corpid"
    t.string "userid"
    t.string "part_id"
    t.string "config_id"
    t.string "qr_code"
    t.string "remark"
    t.string "state"
    t.boolean "skip_verify"
    t.string "suite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_corp_external_users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "uid"
    t.string "unionid"
    t.string "external_userid"
    t.string "pending_id"
    t.string "corpid"
    t.string "subject_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corpid"], name: "index_wechat_corp_external_users_on_corpid"
    t.index ["external_userid"], name: "index_wechat_corp_external_users_on_external_userid"
    t.index ["uid"], name: "index_wechat_corp_external_users_on_uid"
    t.index ["unionid"], name: "index_wechat_corp_external_users_on_unionid"
  end

  create_table "wechat_corp_users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "corpid"
    t.string "suite_id"
    t.string "userid"
    t.string "device_id"
    t.string "user_ticket"
    t.datetime "ticket_expires_at"
    t.string "open_userid"
    t.string "open_id"
    t.string "identity"
    t.string "name"
    t.string "avatar_url"
    t.string "qr_code"
    t.jsonb "department"
    t.integer "follows_count"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_wechat_corp_users_on_organ_id"
    t.index ["suite_id"], name: "index_wechat_corp_users_on_suite_id"
    t.index ["userid"], name: "index_wechat_corp_users_on_userid"
  end

  create_table "wechat_corps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "jsapi_ticket"
    t.datetime "jsapi_ticket_expires_at"
    t.boolean "inviting", comment: "可邀请加入"
    t.string "user_name"
    t.string "domain"
    t.string "url_link"
    t.string "confirm_name"
    t.string "confirm_content"
    t.string "type"
    t.string "name"
    t.string "corpid"
    t.string "open_corpid"
    t.string "agentid"
    t.string "corp_type"
    t.string "subject_type"
    t.datetime "verified_end_at"
    t.string "square_logo_url"
    t.integer "user_max"
    t.string "full_name"
    t.string "wxqrcode"
    t.string "industry"
    t.string "sub_industry"
    t.string "location"
    t.jsonb "auth_corp_info"
    t.jsonb "auth_user_info"
    t.jsonb "register_code_info"
    t.jsonb "agent"
    t.string "agent_ticket"
    t.datetime "agent_ticket_expires_at"
    t.string "permanent_code"
    t.string "suite_id"
    t.string "secret"
    t.string "token"
    t.string "encoding_aes_key"
    t.boolean "debug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corpid"], name: "index_wechat_corps_on_corpid"
    t.index ["open_corpid"], name: "index_wechat_corps_on_open_corpid"
    t.index ["organ_id"], name: "index_wechat_corps_on_organ_id"
  end

  create_table "wechat_extractions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "request_id"
    t.uuid "extractor_id"
    t.string "name"
    t.string "matched"
    t.integer "serial_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["extractor_id"], name: "index_wechat_extractions_on_extractor_id"
    t.index ["request_id"], name: "index_wechat_extractions_on_request_id"
  end

  create_table "wechat_extractors", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "response_id"
    t.string "name"
    t.string "prefix"
    t.string "suffix"
    t.boolean "more"
    t.boolean "serial"
    t.integer "serial_start"
    t.time "start_at"
    t.time "finish_at"
    t.string "valid_response"
    t.string "invalid_response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_wechat_extractors_on_response_id"
  end

  create_table "wechat_hooks", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "response_id"
    t.string "hooked_type"
    t.uuid "hooked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hooked_type", "hooked_id"], name: "index_wechat_hooks_on_hooked"
    t.index ["response_id"], name: "index_wechat_hooks_on_response_id"
  end

  create_table "wechat_medias", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "source_type"
    t.uuid "source_id"
    t.uuid "user_id"
    t.string "media_id"
    t.string "appid"
    t.string "attachment_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_type", "source_id"], name: "index_wechat_medias_on_source"
    t.index ["user_id"], name: "index_wechat_medias_on_user_id"
  end

  create_table "wechat_menu_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "menu_id"
    t.uuid "menu_root_id"
    t.uuid "menu_root_app_id"
    t.uuid "scene_id"
    t.uuid "tag_id"
    t.string "type"
    t.string "name"
    t.string "value"
    t.string "mp_appid"
    t.string "mp_pagepath"
    t.string "appid"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_menu_apps_on_appid"
    t.index ["menu_id"], name: "index_wechat_menu_apps_on_menu_id"
    t.index ["menu_root_app_id"], name: "index_wechat_menu_apps_on_menu_root_app_id"
    t.index ["menu_root_id"], name: "index_wechat_menu_apps_on_menu_root_id"
    t.index ["scene_id"], name: "index_wechat_menu_apps_on_scene_id"
    t.index ["tag_id"], name: "index_wechat_menu_apps_on_tag_id"
  end

  create_table "wechat_menu_disables", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "menu_id"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_menu_disables_on_appid"
    t.index ["menu_id"], name: "index_wechat_menu_disables_on_menu_id"
  end

  create_table "wechat_menu_root_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "menu_root_id"
    t.string "name"
    t.string "appid"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_root_id"], name: "index_wechat_menu_root_apps_on_menu_root_id"
  end

  create_table "wechat_menu_roots", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_menus", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "menu_root_id"
    t.string "type"
    t.string "name"
    t.string "value"
    t.string "mp_appid"
    t.string "mp_pagepath"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_root_id"], name: "index_wechat_menus_on_menu_root_id"
  end

  create_table "wechat_messages", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "platform_id"
    t.string "type"
    t.string "appid"
    t.string "open_id"
    t.string "msg_id"
    t.string "msg_type"
    t.string "content"
    t.string "encrypt_data"
    t.jsonb "message_hash"
    t.string "info_type"
    t.string "msg_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_messages_on_appid"
    t.index ["open_id"], name: "index_wechat_messages_on_open_id"
    t.index ["platform_id"], name: "index_wechat_messages_on_platform_id"
  end

  create_table "wechat_news_reply_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "news_reply_id"
    t.string "title"
    t.string "description"
    t.string "url"
    t.string "raw_pic_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_reply_id"], name: "index_wechat_news_reply_items_on_news_reply_id"
  end

  create_table "wechat_notices", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "notification_id"
    t.uuid "template_id"
    t.uuid "msg_request_id"
    t.string "link"
    t.string "msg_id"
    t.string "status"
    t.string "type"
    t.string "appid"
    t.string "open_id"
    t.jsonb "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["msg_request_id"], name: "index_wechat_notices_on_msg_request_id"
    t.index ["notification_id"], name: "index_wechat_notices_on_notification_id"
    t.index ["template_id"], name: "index_wechat_notices_on_template_id"
  end

  create_table "wechat_partners", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "appid", comment: "sp_appid"
    t.string "mch_id", comment: "支付专用、商户号"
    t.string "key"
    t.string "key_v3"
    t.string "serial_no"
    t.string "apiclient_cert"
    t.string "apiclient_key"
    t.datetime "platform_effective_at"
    t.datetime "platform_expire_at"
    t.string "platform_serial_no"
    t.jsonb "encrypt_certificate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_payee_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "mch_id"
    t.string "appid"
    t.boolean "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_payee_apps_on_appid"
    t.index ["mch_id"], name: "index_wechat_payee_apps_on_mch_id"
    t.index ["organ_id"], name: "index_wechat_payee_apps_on_organ_id"
  end

  create_table "wechat_payee_domains", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "mch_id"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain"], name: "index_wechat_payee_domains_on_domain"
    t.index ["mch_id"], name: "index_wechat_payee_domains_on_mch_id"
  end

  create_table "wechat_payees", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.uuid "partner_id"
    t.string "type"
    t.string "name"
    t.string "mch_id", comment: "支付专用、商户号"
    t.string "key"
    t.string "key_v3"
    t.string "serial_no"
    t.string "apiclient_cert"
    t.string "apiclient_key"
    t.datetime "platform_effective_at"
    t.datetime "platform_expire_at"
    t.string "platform_serial_no"
    t.jsonb "encrypt_certificate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_wechat_payees_on_organ_id"
    t.index ["partner_id"], name: "index_wechat_payees_on_partner_id"
  end

  create_table "wechat_platform_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "platform_id"
    t.string "user_version"
    t.string "user_desc"
    t.integer "template_id"
    t.string "audit_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_wechat_platform_templates_on_platform_id"
  end

  create_table "wechat_platform_tickets", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "signature"
    t.integer "timestamp"
    t.string "nonce"
    t.string "msg_signature"
    t.string "appid"
    t.string "ticket_data"
    t.jsonb "message_hash"
    t.string "info_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_platforms", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "public_agency_id"
    t.uuid "program_agency_id"
    t.string "encoding_aes_key"
    t.string "name"
    t.string "appid"
    t.string "secret"
    t.string "token"
    t.string "verify_ticket"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "pre_auth_code"
    t.datetime "pre_auth_code_expires_at"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_agency_id"], name: "index_wechat_platforms_on_program_agency_id"
    t.index ["public_agency_id"], name: "index_wechat_platforms_on_public_agency_id"
  end

  create_table "wechat_provider_organs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "provider_id"
    t.string "corpid"
    t.string "open_corpid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_wechat_provider_organs_on_provider_id"
  end

  create_table "wechat_providers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "corp_id"
    t.string "provider_secret"
    t.string "token"
    t.string "encoding_aes_key"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corp_id"], name: "index_wechat_providers_on_corp_id"
  end

  create_table "wechat_qy_medias", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "medium_type"
    t.uuid "medium_id"
    t.string "corpid"
    t.string "suite_id"
    t.string "media_id"
    t.string "url"
    t.string "medium_attach"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corpid"], name: "index_wechat_qy_medias_on_corpid"
    t.index ["medium_type", "medium_id"], name: "index_wechat_qy_medias_on_medium"
    t.index ["suite_id"], name: "index_wechat_qy_medias_on_suite_id"
  end

  create_table "wechat_receivers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "app_payee_id"
    t.string "account"
    t.string "name"
    t.string "custom_relation"
    t.jsonb "res"
    t.string "receiver_type"
    t.string "relation_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_payee_id"], name: "index_wechat_receivers_on_app_payee_id"
  end

  create_table "wechat_registers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "organ_id"
    t.string "id_name"
    t.string "id_number"
    t.string "email_code"
    t.string "state"
    t.string "appid"
    t.string "password"
    t.string "mobile"
    t.string "mobile_code"
    t.string "personal_wechat"
    t.string "organ_name"
    t.string "organ_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_wechat_registers_on_organ_id"
    t.index ["user_id"], name: "index_wechat_registers_on_user_id"
  end

  create_table "wechat_replies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "platform_id"
    t.string "messaging_type"
    t.uuid "messaging_id"
    t.uuid "request_id"
    t.uuid "message_send_id"
    t.string "type"
    t.string "value"
    t.string "title"
    t.string "description"
    t.jsonb "body"
    t.string "appid"
    t.string "open_id"
    t.string "nonce"
    t.datetime "created_at"
    t.index ["appid"], name: "index_wechat_replies_on_appid"
    t.index ["message_send_id"], name: "index_wechat_replies_on_message_send_id"
    t.index ["messaging_type", "messaging_id"], name: "index_wechat_replies_on_messaging"
    t.index ["platform_id"], name: "index_wechat_replies_on_platform_id"
    t.index ["request_id"], name: "index_wechat_replies_on_request_id"
  end

  create_table "wechat_request_responses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "response_id"
    t.string "request_type"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_wechat_request_responses_on_response_id"
  end

  create_table "wechat_requests", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "scene_organ_id"
    t.uuid "receive_id"
    t.uuid "platform_id"
    t.datetime "sent_at"
    t.string "type"
    t.string "body"
    t.string "tag_name"
    t.jsonb "raw_body"
    t.string "msg_type"
    t.string "event"
    t.string "event_key"
    t.string "appid"
    t.string "open_id"
    t.string "userid"
    t.integer "handle_id"
    t.jsonb "reply_body"
    t.string "aim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_requests_on_appid"
    t.index ["open_id"], name: "index_wechat_requests_on_open_id"
    t.index ["platform_id"], name: "index_wechat_requests_on_platform_id"
    t.index ["receive_id"], name: "index_wechat_requests_on_receive_id"
    t.index ["scene_organ_id"], name: "index_wechat_requests_on_scene_organ_id"
    t.index ["userid"], name: "index_wechat_requests_on_userid"
  end

  create_table "wechat_responses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "reply_id"
    t.string "match_value"
    t.boolean "contain"
    t.boolean "enabled"
    t.datetime "expire_at"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_responses_on_appid"
    t.index ["reply_id"], name: "index_wechat_responses_on_reply_id"
  end

  create_table "wechat_scenes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "organ_id"
    t.string "handle_type"
    t.uuid "handle_id"
    t.string "match_value"
    t.string "tag_name"
    t.integer "expire_seconds"
    t.datetime "expire_at"
    t.string "qrcode_ticket"
    t.string "qrcode_url"
    t.string "appid"
    t.string "menu_id"
    t.string "note"
    t.string "state_uuid"
    t.string "env_version"
    t.string "aim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_scenes_on_appid"
    t.index ["handle_type", "handle_id"], name: "index_wechat_scenes_on_handle"
    t.index ["organ_id"], name: "index_wechat_scenes_on_organ_id"
  end

  create_table "wechat_services", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "request_id"
    t.string "msgtype"
    t.string "type"
    t.string "value"
    t.string "appid"
    t.string "open_id"
    t.jsonb "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_wechat_services_on_request_id"
  end

  create_table "wechat_suite_receives", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "provider_id"
    t.string "suiteid"
    t.string "corpid"
    t.string "auth_corp_id"
    t.string "user_id"
    t.string "agent_id"
    t.string "msg_id"
    t.string "msg_type"
    t.string "event"
    t.string "event_key"
    t.string "encrypt_data"
    t.jsonb "message_hash"
    t.string "info_type"
    t.string "msg_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corpid"], name: "index_wechat_suite_receives_on_corpid"
    t.index ["provider_id"], name: "index_wechat_suite_receives_on_provider_id"
    t.index ["suiteid"], name: "index_wechat_suite_receives_on_suiteid"
    t.index ["user_id"], name: "index_wechat_suite_receives_on_user_id"
  end

  create_table "wechat_suites", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "name"
    t.string "corp_id"
    t.string "suite_id"
    t.string "secret"
    t.string "token"
    t.string "encoding_aes_key"
    t.string "suite_ticket"
    t.string "suite_ticket_pre"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "pre_auth_code"
    t.datetime "pre_auth_code_expires_at"
    t.string "redirect_controller"
    t.string "redirect_action", comment: "默认跳转"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_supporters", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "corp_id"
    t.string "avatar"
    t.string "name"
    t.string "open_kfid"
    t.boolean "manage_privilege"
    t.string "corpid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corp_id"], name: "index_wechat_supporters_on_corp_id"
    t.index ["corpid"], name: "index_wechat_supporters_on_corpid"
  end

  create_table "wechat_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "tagging_type"
    t.uuid "tagging_id"
    t.uuid "user_tag_id"
    t.string "appid"
    t.string "name"
    t.integer "count"
    t.integer "user_tags_count"
    t.integer "tag_id"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_tags_on_appid"
    t.index ["tagging_type", "tagging_id"], name: "index_wechat_tags_on_tagging"
    t.index ["user_tag_id"], name: "index_wechat_tags_on_user_tag_id"
  end

  create_table "wechat_template_configs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.string "tid"
    t.string "description"
    t.string "notifiable_type"
    t.string "code"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_template_key_words", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "template_config_id"
    t.integer "position"
    t.integer "kid"
    t.string "name"
    t.string "note"
    t.string "example"
    t.string "rule"
    t.string "mapping"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_config_id"], name: "index_wechat_template_key_words_on_template_config_id"
  end

  create_table "wechat_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "template_id"
    t.string "title"
    t.string "content"
    t.string "example"
    t.integer "template_type"
    t.string "appid"
    t.string "template_kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_templates_on_appid"
  end

  create_table "wechat_user_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "member_inviter_id"
    t.uuid "user_tagged_id"
    t.string "tag_name"
    t.string "appid"
    t.string "open_id"
    t.boolean "synced"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_user_tags_on_appid"
    t.index ["member_inviter_id"], name: "index_wechat_user_tags_on_member_inviter_id"
    t.index ["open_id"], name: "index_wechat_user_tags_on_open_id"
    t.index ["tag_name"], name: "index_wechat_user_tags_on_tag_name"
    t.index ["user_tagged_id"], name: "index_wechat_user_tags_on_user_tagged_id"
  end
end
