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

ActiveRecord::Schema[8.1].define(version: 2025_10_03_133407) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "action_mailbox_inbound_emails", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "message_checksum", null: false
    t.string "message_id", null: false
    t.integer "status", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.uuid "record_id"
    t.string "record_type"
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
    t.index ["record_type", "record_id"], name: "index_action_text_rich_texts_on_record"
  end

  create_table "active_storage_attachments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "blob_id"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.uuid "record_id"
    t.string "record_type"
    t.datetime "updated_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id"], name: "index_active_storage_attachments_on_record"
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.jsonb "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "blob_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id"], name: "index_active_storage_variant_records_on_blob_id"
  end

  create_table "alipay_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "organ_id"
    t.string "private_rsa"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_alipay_apps_on_organ_id"
  end

  create_table "attend_absence_stats", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.float "annual_add"
    t.float "annual_days"
    t.datetime "created_at", null: false
    t.string "details"
    t.float "left_annual_days"
    t.uuid "member_id"
    t.datetime "updated_at", null: false
    t.float "vacation_days"
    t.string "year"
    t.index ["member_id"], name: "index_attend_absence_stats_on_member_id"
  end

  create_table "attend_absences", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.boolean "divided"
    t.datetime "finish_at"
    t.float "hours"
    t.string "kind"
    t.uuid "member_id"
    t.uuid "merged_id"
    t.string "note"
    t.boolean "processed"
    t.boolean "redeeming"
    t.jsonb "redeeming_days"
    t.datetime "start_at"
    t.string "state"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_attend_absences_on_member_id"
    t.index ["merged_id"], name: "index_attend_absences_on_merged_id"
  end

  create_table "attend_attendance_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "attendance_id"
    t.datetime "created_at", null: false
    t.string "kind"
    t.uuid "member_id"
    t.string "name"
    t.string "note"
    t.string "number"
    t.boolean "processed"
    t.datetime "record_at"
    t.string "record_at_str"
    t.string "source"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["attendance_id"], name: "index_attend_attendance_logs_on_attendance_id"
    t.index ["member_id"], name: "index_attend_attendance_logs_on_member_id"
  end

  create_table "attend_attendance_settings", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "effect_on"
    t.date "expire_on"
    t.uuid "member_id"
    t.string "note"
    t.string "off_time"
    t.string "on_time"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_attend_attendance_settings_on_member_id"
  end

  create_table "attend_attendance_stats", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.float "absence_redeeming_hours"
    t.integer "allowance_days"
    t.float "cost_absence_hours"
    t.string "costed_absence"
    t.datetime "created_at", null: false
    t.uuid "financial_month_id"
    t.string "free_absence"
    t.float "holiday_redeeming_hours"
    t.integer "late_days"
    t.uuid "member_id"
    t.boolean "processed"
    t.string "redeeming_absence"
    t.datetime "updated_at", null: false
    t.index ["financial_month_id"], name: "index_attend_attendance_stats_on_financial_month_id"
    t.index ["member_id"], name: "index_attend_attendance_stats_on_member_id"
  end

  create_table "attend_attendances", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "absence_minutes"
    t.boolean "absence_redeeming"
    t.float "attend_hours"
    t.date "attend_on"
    t.datetime "created_at", null: false
    t.datetime "finish_at"
    t.uuid "interval_absence_id"
    t.datetime "interval_finish_at"
    t.float "interval_hours"
    t.datetime "interval_start_at"
    t.string "kind"
    t.uuid "late_absence_id"
    t.integer "late_minutes"
    t.uuid "leave_absence_id"
    t.integer "leave_minutes"
    t.jsonb "lost_logs"
    t.uuid "member_id"
    t.float "overtime_hours"
    t.boolean "processed"
    t.datetime "start_at"
    t.float "total_hours"
    t.datetime "updated_at", null: false
    t.boolean "workday"
    t.index ["interval_absence_id"], name: "index_attend_attendances_on_interval_absence_id"
    t.index ["late_absence_id"], name: "index_attend_attendances_on_late_absence_id"
    t.index ["leave_absence_id"], name: "index_attend_attendances_on_leave_absence_id"
    t.index ["member_id"], name: "index_attend_attendances_on_member_id"
  end

  create_table "attend_extra_days", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "kind"
    t.string "name"
    t.uuid "organ_id"
    t.string "scope"
    t.date "the_day"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_attend_extra_days_on_organ_id"
  end

  create_table "attend_financial_months", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.date "begin_date"
    t.string "color"
    t.datetime "created_at", null: false
    t.date "end_date"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.string "working_days"
    t.index ["organ_id"], name: "index_attend_financial_months_on_organ_id"
  end

  create_table "attend_overtimes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "finish_at"
    t.float "hours"
    t.uuid "member_id"
    t.string "note"
    t.datetime "start_at"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_attend_overtimes_on_member_id"
  end

  create_table "auditor_approvals", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.boolean "approved"
    t.datetime "approved_at"
    t.uuid "approving_id"
    t.string "approving_type"
    t.string "comment"
    t.datetime "created_at", null: false
    t.uuid "operator_id"
    t.string "operator_type"
    t.jsonb "pending_changes"
    t.jsonb "related_changes"
    t.string "state"
    t.integer "unapproved_approvals_count"
    t.datetime "updated_at", null: false
    t.index ["approving_type", "approving_id"], name: "index_auditor_approvals_on_approving"
    t.index ["operator_type", "operator_id"], name: "index_auditor_approvals_on_operator"
  end

  create_table "auditor_audits", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "action"
    t.string "action_name"
    t.jsonb "audited_changes"
    t.uuid "audited_id"
    t.string "audited_type"
    t.string "controller_path"
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.string "note"
    t.uuid "operator_id"
    t.string "operator_type"
    t.jsonb "related_changes"
    t.string "remote_ip"
    t.string "type"
    t.index ["audited_type", "audited_id"], name: "index_auditor_audits_on_audited"
    t.index ["created_at"], name: "index_auditor_audits_on_created_at"
    t.index ["operator_type", "operator_id"], name: "index_auditor_audits_on_operator"
  end

  create_table "auditor_verifications", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.uuid "job_title_id"
    t.uuid "member_id"
    t.string "note"
    t.integer "position"
    t.string "state"
    t.datetime "updated_at", null: false
    t.uuid "verified_id"
    t.string "verified_type"
    t.uuid "verifier_id"
    t.index ["job_title_id"], name: "index_auditor_verifications_on_job_title_id"
    t.index ["member_id"], name: "index_auditor_verifications_on_member_id"
    t.index ["verified_type", "verified_id"], name: "index_auditor_verifications_on_verified"
    t.index ["verifier_id"], name: "index_auditor_verifications_on_verifier_id"
  end

  create_table "auditor_verifiers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "job_title_id"
    t.uuid "member_id"
    t.string "name"
    t.integer "position"
    t.datetime "updated_at", null: false
    t.uuid "verifiable_id"
    t.string "verifiable_type"
    t.index ["job_title_id"], name: "index_auditor_verifiers_on_job_title_id"
    t.index ["member_id"], name: "index_auditor_verifiers_on_member_id"
    t.index ["verifiable_type", "verifiable_id"], name: "index_auditor_verifiers_on_verifiable"
  end

  create_table "auth_accounts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.string "identity"
    t.string "source"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["identity", "confirmed"], name: "index_auth_accounts_on_identity_and_confirmed"
    t.index ["identity"], name: "index_auth_accounts_on_identity"
    t.index ["user_id"], name: "index_auth_accounts_on_user_id"
  end

  create_table "auth_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.datetime "created_at", null: false
    t.string "host"
    t.string "key"
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_auth_apps_on_appid"
  end

  create_table "auth_oauth_users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "access_token"
    t.boolean "agency_oauth"
    t.string "app_name"
    t.string "appid"
    t.string "avatar_url"
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.datetime "expires_at"
    t.jsonb "extra"
    t.string "identity"
    t.string "name"
    t.datetime "offline_at"
    t.datetime "online_at"
    t.uuid "organ_id"
    t.string "provider"
    t.string "refresh_token"
    t.string "remark"
    t.string "scene_tag"
    t.string "scope"
    t.string "session_key"
    t.string "source"
    t.string "state"
    t.string "type"
    t.string "uid"
    t.string "unionid"
    t.datetime "unsubscribe_at"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["identity"], name: "index_auth_oauth_users_on_identity"
    t.index ["organ_id"], name: "index_auth_oauth_users_on_organ_id"
    t.index ["uid", "type"], name: "index_auth_oauth_users_on_uid_and_type", unique: true
    t.index ["unionid"], name: "index_auth_oauth_users_on_unionid"
    t.index ["user_id"], name: "index_auth_oauth_users_on_user_id"
  end

  create_table "auth_sessions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "access_counter"
    t.string "appid"
    t.string "auth_appid"
    t.string "business"
    t.string "corp_userid"
    t.datetime "created_at", null: false
    t.string "encrypted_token"
    t.datetime "expires_at"
    t.string "identity"
    t.string "ip_address"
    t.uuid "member_id"
    t.boolean "mock_member"
    t.boolean "mock_user"
    t.datetime "offline_at"
    t.datetime "online_at"
    t.string "session_id"
    t.string "suite_id"
    t.string "uid"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.uuid "user_id"
    t.index ["identity"], name: "index_auth_sessions_on_identity"
    t.index ["member_id"], name: "index_auth_sessions_on_member_id"
    t.index ["user_id"], name: "index_auth_sessions_on_user_id"
  end

  create_table "auth_user_taggeds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.uuid "user_tag_id"
    t.index ["user_id"], name: "index_auth_user_taggeds_on_user_id"
    t.index ["user_tag_id"], name: "index_auth_user_taggeds_on_user_tag_id"
  end

  create_table "auth_user_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.integer "user_taggeds_count"
    t.uuid "user_tagging_id"
    t.string "user_tagging_type"
    t.index ["organ_id"], name: "index_auth_user_tags_on_organ_id"
    t.index ["user_tagging_type", "user_tagging_id"], name: "index_auth_user_tags_on_user_tagging"
  end

  create_table "auth_users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.boolean "accept_email"
    t.boolean "admin"
    t.uuid "cache_id"
    t.jsonb "counters"
    t.datetime "created_at", null: false
    t.boolean "disabled"
    t.string "invited_code"
    t.datetime "last_login_at"
    t.string "last_login_ip"
    t.string "locale"
    t.string "name"
    t.string "notifiable_types"
    t.string "password_digest"
    t.integer "pomodoro"
    t.integer "promote_goods_count"
    t.integer "showtime"
    t.string "source"
    t.string "timezone"
    t.datetime "updated_at", null: false
    t.index ["cache_id"], name: "index_auth_users_on_cache_id"
  end

  create_table "auth_verify_tokens", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "access_counter"
    t.datetime "created_at", null: false
    t.datetime "expires_at"
    t.string "identity"
    t.string "token"
    t.string "type"
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.index ["identity"], name: "index_auth_verify_tokens_on_identity"
  end

  create_table "bench_facilitate_indicators", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "facilitate_id"
    t.uuid "facilitate_taxon_id"
    t.uuid "indicator_id"
    t.string "note"
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_facilitate_indicators_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_bench_facilitate_indicators_on_facilitate_taxon_id"
    t.index ["indicator_id"], name: "index_bench_facilitate_indicators_on_indicator_id"
  end

  create_table "bench_facilitate_providers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "facilitate_id"
    t.string "note"
    t.uuid "provider_id"
    t.boolean "selected"
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_facilitate_providers_on_facilitate_id"
    t.index ["provider_id"], name: "index_bench_facilitate_providers_on_provider_id"
  end

  create_table "bench_facilitate_taxon_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "bench/facilitate_taxon_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_bench_facilitate_taxon_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_bench_facilitate_taxon_hierarchies_on_descendant_id"
  end

  create_table "bench_facilitate_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.string "description"
    t.integer "facilitates_count"
    t.integer "indicators_count"
    t.string "name"
    t.uuid "organ_id"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.integer "position"
    t.uuid "taxon_id"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bench_facilitate_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_bench_facilitate_taxons_on_parent_id"
    t.index ["taxon_id"], name: "index_bench_facilitate_taxons_on_taxon_id"
  end

  create_table "bench_facilitates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.datetime "created_at", null: false
    t.string "description"
    t.jsonb "extra"
    t.uuid "facilitate_taxon_id"
    t.string "good_type"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.string "name"
    t.uuid "organ_id"
    t.decimal "price"
    t.boolean "published"
    t.string "qr_prefix"
    t.decimal "quantity"
    t.string "sku"
    t.uuid "standard_id"
    t.decimal "step", comment: "Item Number Step"
    t.decimal "unified_quantity"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.jsonb "wallet_price"
    t.index ["facilitate_taxon_id"], name: "index_bench_facilitates_on_facilitate_taxon_id"
    t.index ["organ_id"], name: "index_bench_facilitates_on_organ_id"
    t.index ["standard_id"], name: "index_bench_facilitates_on_standard_id"
  end

  create_table "bench_facilitatings", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.datetime "created_at", null: false
    t.datetime "estimate_finish_at"
    t.jsonb "extra"
    t.uuid "facilitate_id"
    t.uuid "facilitator_id"
    t.datetime "finish_at"
    t.string "good_type"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.uuid "item_id"
    t.uuid "member_id"
    t.string "name"
    t.decimal "price"
    t.decimal "quantity"
    t.string "sku"
    t.datetime "start_at"
    t.decimal "step", comment: "Item Number Step"
    t.decimal "unified_quantity"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.uuid "wallet_payment_id"
    t.jsonb "wallet_price"
    t.index ["facilitate_id"], name: "index_bench_facilitatings_on_facilitate_id"
    t.index ["facilitator_id"], name: "index_bench_facilitatings_on_facilitator_id"
    t.index ["item_id"], name: "index_bench_facilitatings_on_item_id"
    t.index ["member_id"], name: "index_bench_facilitatings_on_member_id"
    t.index ["user_id"], name: "index_bench_facilitatings_on_user_id"
    t.index ["wallet_payment_id"], name: "index_bench_facilitatings_on_wallet_payment_id"
  end

  create_table "bench_facilitators", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.uuid "facilitate_id"
    t.uuid "member_id"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_facilitators_on_facilitate_id"
    t.index ["member_id"], name: "index_bench_facilitators_on_member_id"
  end

  create_table "bench_indicators", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.decimal "reference_max"
    t.decimal "reference_min"
    t.string "target_source"
    t.string "unit"
    t.datetime "updated_at", null: false
  end

  create_table "bench_mileposts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "organ_id"
    t.integer "position"
    t.integer "project_mileposts_count"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bench_mileposts_on_organ_id"
  end

  create_table "bench_project_facilitates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "facilitate_id"
    t.uuid "facilitate_taxon_id"
    t.uuid "project_id"
    t.uuid "provider_id"
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_project_facilitates_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_bench_project_facilitates_on_facilitate_taxon_id"
    t.index ["project_id"], name: "index_bench_project_facilitates_on_project_id"
    t.index ["provider_id"], name: "index_bench_project_facilitates_on_provider_id"
  end

  create_table "bench_project_indicators", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.uuid "indicator_id"
    t.uuid "project_id"
    t.datetime "recorded_at"
    t.date "recorded_on"
    t.string "source"
    t.string "state"
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["indicator_id"], name: "index_bench_project_indicators_on_indicator_id"
    t.index ["project_id"], name: "index_bench_project_indicators_on_project_id"
  end

  create_table "bench_project_mileposts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "current"
    t.uuid "milepost_id"
    t.string "milepost_name"
    t.uuid "project_id"
    t.date "recorded_on"
    t.datetime "updated_at", null: false
    t.index ["milepost_id"], name: "index_bench_project_mileposts_on_milepost_id"
    t.index ["project_id"], name: "index_bench_project_mileposts_on_project_id"
  end

  create_table "bench_project_stages", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.date "begin_on"
    t.decimal "budget_amount"
    t.datetime "created_at", null: false
    t.date "end_on"
    t.decimal "expense_amount"
    t.decimal "fund_budget"
    t.decimal "fund_expense"
    t.string "name"
    t.string "note"
    t.integer "projects_count"
    t.datetime "updated_at", null: false
  end

  create_table "bench_project_webhooks", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "origin_data"
    t.uuid "project_id"
    t.datetime "updated_at", null: false
    t.jsonb "valuable_data"
    t.index ["project_id"], name: "index_bench_project_webhooks_on_project_id"
  end

  create_table "bench_projects", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "budget_amount"
    t.datetime "created_at", null: false
    t.string "description"
    t.decimal "expense_amount"
    t.jsonb "extra"
    t.decimal "fund_budget"
    t.decimal "fund_expense"
    t.string "name"
    t.uuid "organ_id"
    t.string "state"
    t.uuid "taxon_id"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bench_projects_on_organ_id"
    t.index ["taxon_id"], name: "index_bench_projects_on_taxon_id"
  end

  create_table "bench_standard_providers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "export_price"
    t.uuid "facilitate_id"
    t.string "note"
    t.boolean "selected"
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_standard_providers_on_facilitate_id"
  end

  create_table "bench_standards", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "bench_task_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "bench/task_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_bench_task_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_bench_task_hierarchies_on_descendant_id"
  end

  create_table "bench_task_template_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "bench/task_template_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_bench_task_template_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_bench_task_template_hierarchies_on_descendant_id"
  end

  create_table "bench_task_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.uuid "department_id"
    t.uuid "job_title_id"
    t.uuid "member_id"
    t.uuid "organ_id"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.integer "position"
    t.jsonb "repeat_days"
    t.string "repeat_type"
    t.uuid "taxon_id"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_bench_task_templates_on_department_id"
    t.index ["job_title_id"], name: "index_bench_task_templates_on_job_title_id"
    t.index ["member_id"], name: "index_bench_task_templates_on_member_id"
    t.index ["organ_id"], name: "index_bench_task_templates_on_organ_id"
    t.index ["parent_id"], name: "index_bench_task_templates_on_parent_id"
    t.index ["taxon_id"], name: "index_bench_task_templates_on_taxon_id"
  end

  create_table "bench_task_timers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "duration"
    t.datetime "finish_at"
    t.uuid "task_id"
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_bench_task_timers_on_task_id"
  end

  create_table "bench_tasks", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "actual_time"
    t.integer "children_count"
    t.decimal "cost_fund"
    t.integer "cost_stock"
    t.datetime "created_at", null: false
    t.date "deadline_on"
    t.uuid "department_id"
    t.datetime "done_at"
    t.integer "estimated_time"
    t.string "focus"
    t.uuid "job_title_id"
    t.uuid "member_id"
    t.string "note"
    t.uuid "organ_id"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.integer "position"
    t.uuid "project_id"
    t.string "serial_number", comment: "Task Template test repeat"
    t.datetime "start_at"
    t.string "state"
    t.uuid "task_template_id"
    t.string "title"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
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
    t.datetime "created_at", null: false
    t.uuid "facilitate_id"
    t.uuid "taxon_id"
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_taxon_facilitates_on_facilitate_id"
    t.index ["taxon_id"], name: "index_bench_taxon_facilitates_on_taxon_id"
  end

  create_table "bench_taxon_indicators", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "indicator_id"
    t.uuid "taxon_id"
    t.datetime "updated_at", null: false
    t.integer "weight"
    t.index ["indicator_id"], name: "index_bench_taxon_indicators_on_indicator_id"
    t.index ["taxon_id"], name: "index_bench_taxon_indicators_on_taxon_id"
  end

  create_table "bench_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "budget_amount"
    t.datetime "created_at", null: false
    t.decimal "expense_amount"
    t.decimal "fund_budget"
    t.decimal "fund_expense"
    t.string "name"
    t.jsonb "parameters"
    t.integer "projects_count"
    t.string "record_name"
    t.datetime "updated_at", null: false
  end

  create_table "bluetooth_devices", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bluetooth_devices_on_organ_id"
  end

  create_table "bluetooth_errs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "err_msg"
    t.string "name"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bluetooth_errs_on_organ_id"
  end

  create_table "cms_audio_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "audio_id"
    t.datetime "created_at", null: false
    t.uuid "tag_id"
    t.datetime "updated_at", null: false
    t.index ["audio_id"], name: "index_cms_audio_tags_on_audio_id"
    t.index ["tag_id"], name: "index_cms_audio_tags_on_tag_id"
  end

  create_table "cms_audios", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "author_id"
    t.datetime "created_at", null: false
    t.uuid "organ_id"
    t.string "state"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_cms_audios_on_author_id"
    t.index ["organ_id"], name: "index_cms_audios_on_organ_id"
  end

  create_table "cms_carousels", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "enabled"
    t.string "link"
    t.uuid "organ_id"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_cms_carousels_on_organ_id"
  end

  create_table "cms_covers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "organ_id"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_cms_covers_on_organ_id"
  end

  create_table "cms_progressions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "duration"
    t.uuid "progressive_id"
    t.string "progressive_type"
    t.decimal "ratio", comment: "完成比例"
    t.string "state"
    t.decimal "time"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["progressive_type", "progressive_id"], name: "index_cms_progressions_on_progressive"
    t.index ["user_id"], name: "index_cms_progressions_on_user_id"
  end

  create_table "cms_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "cms_videos", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "author_id"
    t.integer "comments_count"
    t.datetime "created_at", null: false
    t.integer "liked_count"
    t.uuid "organ_id"
    t.integer "share_count"
    t.string "state"
    t.string "title"
    t.datetime "updated_at", null: false
    t.uuid "video_taxon_id"
    t.integer "view_count"
    t.string "water_mark_job"
    t.index ["author_id"], name: "index_cms_videos_on_author_id"
    t.index ["organ_id"], name: "index_cms_videos_on_organ_id"
    t.index ["video_taxon_id"], name: "index_cms_videos_on_video_taxon_id"
  end

  create_table "com_acme_accounts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "kid"
    t.datetime "updated_at", null: false
  end

  create_table "com_acme_domains", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "acme_servicer_id"
    t.datetime "created_at", null: false
    t.string "domain"
    t.datetime "updated_at", null: false
    t.index ["acme_servicer_id"], name: "index_com_acme_domains_on_acme_servicer_id"
  end

  create_table "com_acme_identifiers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "acme_order_id"
    t.datetime "created_at", null: false
    t.string "domain"
    t.string "domain_root"
    t.string "file_content"
    t.string "file_name"
    t.string "identifier"
    t.string "record_content"
    t.string "record_name"
    t.string "status"
    t.string "token"
    t.string "type"
    t.datetime "updated_at", null: false
    t.string "url"
    t.boolean "wildcard"
    t.index ["acme_order_id"], name: "index_com_acme_identifiers_on_acme_order_id"
  end

  create_table "com_acme_orders", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "acme_account_id"
    t.datetime "created_at", null: false
    t.datetime "expire_at", comment: "过期时间"
    t.string "identifiers", array: true
    t.datetime "issued_at"
    t.string "orderid"
    t.string "status"
    t.string "sync_host"
    t.string "sync_path"
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["acme_account_id"], name: "index_com_acme_orders_on_acme_account_id"
  end

  create_table "com_acme_servicers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "key"
    t.string "secret"
    t.string "type"
    t.datetime "updated_at", null: false
  end

  create_table "com_blob_defaults", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "macro"
    t.string "name", comment: "名称, attach 名称，如：avatar"
    t.string "record_class", comment: "AR 类名，如 User"
    t.datetime "updated_at", null: false
  end

  create_table "com_blob_pdfs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "com_blob_temps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "note"
    t.datetime "updated_at", null: false
  end

  create_table "com_cache_lists", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "key"
    t.string "path"
    t.datetime "updated_at", null: false
  end

  create_table "com_csps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "blocked_uri"
    t.string "column_number"
    t.datetime "created_at", null: false
    t.string "disposition"
    t.string "document_uri"
    t.string "effective_directive"
    t.string "line_number"
    t.string "original_policy"
    t.string "referrer"
    t.string "script_sample"
    t.string "source_file"
    t.string "status_code"
    t.datetime "updated_at", null: false
    t.string "violated_directive"
  end

  create_table "com_detector_bots", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "detector_id"
    t.string "hook_url"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["detector_id"], name: "index_com_detector_bots_on_detector_id"
  end

  create_table "com_detector_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.uuid "detector_id"
    t.string "error"
    t.integer "spend", comment: "单位为毫秒"
    t.datetime "started_at"
    t.string "status"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["detector_id"], name: "index_com_detector_logs_on_detector_id"
  end

  create_table "com_detectors", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "com_err_bots", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "base_url"
    t.datetime "created_at", null: false
    t.boolean "first_time"
    t.string "hook_key"
    t.string "hook_url"
    t.string "secret"
    t.string "type"
    t.datetime "updated_at", null: false
  end

  create_table "com_err_notices", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "controller_name"
    t.datetime "created_at", null: false
    t.uuid "err_bot_id"
    t.datetime "updated_at", null: false
    t.index ["controller_name"], name: "index_com_err_notices_on_controller_name"
    t.index ["err_bot_id"], name: "index_com_err_notices_on_err_bot_id"
  end

  create_table "com_err_summaries", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "action_name"
    t.string "controller_name"
    t.datetime "created_at", null: false
    t.integer "errs_count"
    t.string "exception_object"
    t.datetime "updated_at", null: false
  end

  create_table "com_errs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "action_name"
    t.string "controller_name"
    t.jsonb "cookie"
    t.datetime "created_at", null: false
    t.string "exception"
    t.string "exception_backtrace", array: true
    t.string "exception_object"
    t.jsonb "headers"
    t.string "ip"
    t.jsonb "params"
    t.string "path"
    t.jsonb "session"
    t.datetime "updated_at", null: false
  end

  create_table "com_filter_columns", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "column"
    t.datetime "created_at", null: false
    t.uuid "filter_id"
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["filter_id"], name: "index_com_filter_columns_on_filter_id"
  end

  create_table "com_filters", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "action_name"
    t.string "controller_path", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.index ["controller_path", "action_name"], name: "index_com_filters_on_controller_path_and_action_name"
    t.index ["organ_id"], name: "index_com_filters_on_organ_id"
  end

  create_table "com_infos", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "platform"
    t.datetime "updated_at", null: false
    t.string "value"
    t.string "version"
  end

  create_table "com_meta_actions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "action_name"
    t.string "business_identifier", null: false
    t.string "controller_name", null: false
    t.string "controller_path", null: false
    t.datetime "created_at", null: false
    t.boolean "landmark"
    t.string "namespace_identifier", null: false
    t.string "operation"
    t.string "path"
    t.integer "position"
    t.string "required_parts", array: true
    t.datetime "synced_at"
    t.datetime "updated_at", null: false
    t.string "verb"
    t.index ["business_identifier"], name: "index_com_meta_actions_on_business_identifier"
    t.index ["controller_path"], name: "index_com_meta_actions_on_controller_path"
    t.index ["namespace_identifier"], name: "index_com_meta_actions_on_namespace_identifier"
  end

  create_table "com_meta_businesses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "identifier", null: false
    t.string "name"
    t.integer "position"
    t.datetime "synced_at"
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_com_meta_businesses_on_identifier"
  end

  create_table "com_meta_columns", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.boolean "belongs_enable"
    t.string "belongs_table"
    t.integer "column_limit"
    t.string "column_name"
    t.string "column_type"
    t.string "comment"
    t.datetime "created_at", null: false
    t.boolean "defined_db"
    t.boolean "defined_model"
    t.string "record_name"
    t.string "sql_type"
    t.datetime "updated_at", null: false
    t.index ["record_name"], name: "index_com_meta_columns_on_record_name"
  end

  create_table "com_meta_controllers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "business_identifier", null: false
    t.string "controller_name", null: false
    t.string "controller_path", null: false
    t.datetime "created_at", null: false
    t.string "namespace_identifier", null: false
    t.integer "position"
    t.datetime "synced_at"
    t.datetime "updated_at", null: false
    t.index ["business_identifier"], name: "index_com_meta_controllers_on_business_identifier"
    t.index ["controller_path"], name: "index_com_meta_controllers_on_controller_path"
    t.index ["namespace_identifier"], name: "index_com_meta_controllers_on_namespace_identifier"
  end

  create_table "com_meta_models", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "business_identifier", null: false
    t.datetime "created_at", null: false
    t.boolean "customizable", comment: "是否允许用户定制"
    t.boolean "defined_db"
    t.string "description"
    t.string "name"
    t.string "record_name"
    t.string "table_name"
    t.datetime "updated_at", null: false
    t.index ["business_identifier"], name: "index_com_meta_models_on_business_identifier"
    t.index ["record_name"], name: "index_com_meta_models_on_record_name"
  end

  create_table "com_meta_namespaces", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "identifier", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.boolean "verify_member"
    t.boolean "verify_organ"
    t.boolean "verify_user"
    t.index ["identifier"], name: "index_com_meta_namespaces_on_identifier"
  end

  create_table "com_meta_operations", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "action_name"
    t.datetime "created_at", null: false
    t.string "operation"
    t.datetime "updated_at", null: false
  end

  create_table "com_ssh_keys", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.string "fingerprint"
    t.string "host"
    t.string "private_key"
    t.string "public_key"
    t.string "ssh_user"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["user_id"], name: "index_com_ssh_keys_on_user_id"
  end

  create_table "com_state_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "com/state_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_com_state_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_com_state_hierarchies_on_descendant_id"
  end

  create_table "com_states", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "action_name"
    t.string "auth_token"
    t.jsonb "body"
    t.string "controller_path"
    t.jsonb "cookie"
    t.datetime "created_at", null: false
    t.boolean "destroyable"
    t.string "host"
    t.uuid "organ_id"
    t.jsonb "params"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.string "path"
    t.string "referer"
    t.string "request_method"
    t.jsonb "session"
    t.string "session_id"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["organ_id"], name: "index_com_states_on_organ_id"
    t.index ["user_id"], name: "index_com_states_on_user_id"
  end

  create_table "crm_agencies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "agent_id"
    t.string "agent_type"
    t.uuid "client_id"
    t.string "client_type"
    t.decimal "commission_ratio", comment: "交易时抽成比例"
    t.datetime "created_at", null: false
    t.string "note", comment: "备注"
    t.string "relation"
    t.datetime "updated_at", null: false
    t.index ["agent_type", "agent_id"], name: "index_crm_agencies_on_agent"
    t.index ["client_type", "client_id"], name: "index_crm_agencies_on_client"
  end

  create_table "crm_client_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "crm/client_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_crm_client_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_crm_client_hierarchies_on_descendant_id"
  end

  create_table "crm_clients", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "addresses_count"
    t.integer "cards_count"
    t.integer "carts_count"
    t.uuid "client_organ_id"
    t.datetime "created_at", null: false
    t.integer "items_count"
    t.string "name"
    t.integer "orders_count"
    t.uuid "organ_id"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.jsonb "settings"
    t.datetime "updated_at", null: false
    t.integer "wallets_count"
    t.index ["client_organ_id"], name: "index_crm_clients_on_client_organ_id"
    t.index ["organ_id"], name: "index_crm_clients_on_organ_id"
    t.index ["parent_id"], name: "index_crm_clients_on_parent_id"
  end

  create_table "crm_contacts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "addresses_count"
    t.string "avatar_url"
    t.integer "cards_count"
    t.integer "carts_count"
    t.uuid "client_id"
    t.uuid "client_member_id"
    t.uuid "client_user_id"
    t.string "corp_full_name"
    t.string "corp_name"
    t.string "corpid"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.string "external_type"
    t.string "external_userid"
    t.jsonb "extra"
    t.string "identity"
    t.integer "items_count"
    t.string "name"
    t.integer "orders_count"
    t.uuid "organ_id"
    t.string "position"
    t.string "unionid"
    t.datetime "updated_at", null: false
    t.integer "wallets_count"
    t.string "wechat_openid"
    t.index ["client_id"], name: "index_crm_contacts_on_client_id"
    t.index ["client_member_id"], name: "index_crm_contacts_on_client_member_id"
    t.index ["client_user_id"], name: "index_crm_contacts_on_client_user_id"
    t.index ["organ_id"], name: "index_crm_contacts_on_organ_id"
    t.index ["unionid"], name: "index_crm_contacts_on_unionid"
    t.index ["wechat_openid"], name: "index_crm_contacts_on_wechat_openid"
  end

  create_table "crm_maintain_sources", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "maintains_count"
    t.string "name"
    t.uuid "organ_id"
    t.uuid "source_id"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_crm_maintain_sources_on_organ_id"
    t.index ["source_id"], name: "index_crm_maintain_sources_on_source_id"
  end

  create_table "crm_maintain_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.string "entity_column"
    t.string "entity_value"
    t.string "logged_type"
    t.boolean "manual"
    t.string "name"
    t.integer "notes_count"
    t.uuid "organ_id"
    t.integer "sequence"
    t.uuid "tag_id"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_crm_maintain_tags_on_organ_id"
    t.index ["tag_id"], name: "index_crm_maintain_tags_on_tag_id"
  end

  create_table "crm_maintains", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "add_way"
    t.uuid "agency_id"
    t.uuid "agent_id"
    t.string "agent_type"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "external_userid"
    t.uuid "maintain_source_id"
    t.uuid "member_id"
    t.string "oper_userid"
    t.uuid "organ_id"
    t.uuid "original_id"
    t.string "pending_id"
    t.integer "position"
    t.string "remark"
    t.jsonb "remark_mobiles"
    t.string "state"
    t.uuid "task_template_id"
    t.string "type"
    t.datetime "updated_at", null: false
    t.uuid "upstream_id"
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
    t.uuid "client_id"
    t.uuid "contact_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.uuid "logged_id"
    t.string "logged_type"
    t.uuid "maintain_tag_id"
    t.uuid "member_id"
    t.integer "tag_sequence"
    t.string "tag_str"
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_crm_notes_on_client_id"
    t.index ["contact_id"], name: "index_crm_notes_on_contact_id"
    t.index ["logged_type", "logged_id"], name: "index_crm_notes_on_logged"
    t.index ["maintain_tag_id"], name: "index_crm_notes_on_maintain_tag_id"
    t.index ["member_id"], name: "index_crm_notes_on_member_id"
  end

  create_table "crm_qrcodes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "align"
    t.datetime "created_at", null: false
    t.integer "fixed_width"
    t.integer "margin_x"
    t.integer "margin_y"
    t.uuid "source_id"
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_crm_qrcodes_on_source_id"
  end

  create_table "crm_source_contacts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "contact_id"
    t.datetime "created_at", null: false
    t.uuid "maintain_source_id"
    t.uuid "organ_id"
    t.uuid "source_id"
    t.uuid "trade_item_id"
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_crm_source_contacts_on_contact_id"
    t.index ["maintain_source_id"], name: "index_crm_source_contacts_on_maintain_source_id"
    t.index ["organ_id"], name: "index_crm_source_contacts_on_organ_id"
    t.index ["source_id"], name: "index_crm_source_contacts_on_source_id"
    t.index ["trade_item_id"], name: "index_crm_source_contacts_on_trade_item_id"
  end

  create_table "crm_source_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "crm/source_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_crm_source_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_crm_source_hierarchies_on_descendant_id"
  end

  create_table "crm_sources", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.integer "fixed_width"
    t.string "good_type"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.boolean "materialize"
    t.string "name"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.decimal "price"
    t.decimal "quantity"
    t.string "sku"
    t.decimal "step", comment: "Item Number Step"
    t.decimal "unified_quantity"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.jsonb "wallet_price"
    t.index ["parent_id"], name: "index_crm_sources_on_parent_id"
  end

  create_table "crm_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.string "entity_column"
    t.string "entity_value"
    t.string "logged_type"
    t.string "name"
    t.integer "sequence"
    t.datetime "updated_at", null: false
  end

  create_table "crm_texts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "align"
    t.datetime "created_at", null: false
    t.string "font"
    t.integer "margin_x"
    t.integer "margin_y"
    t.string "note"
    t.uuid "source_id"
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_crm_texts_on_source_id"
  end

  create_table "datum_data_lists", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.jsonb "columns"
    t.string "comment"
    t.datetime "created_at", null: false
    t.string "data_table"
    t.string "export_excel"
    t.string "export_pdf"
    t.jsonb "parameters"
    t.string "title"
    t.string "type"
    t.datetime "updated_at", null: false
    t.integer "x_position"
  end

  create_table "datum_export_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "export_id"
    t.jsonb "extra"
    t.jsonb "fields"
    t.integer "position"
    t.datetime "updated_at", null: false
    t.index ["export_id"], name: "index_datum_export_items_on_export_id"
  end

  create_table "datum_exports", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.jsonb "editable"
    t.jsonb "formats"
    t.string "name"
    t.uuid "template_id"
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_datum_exports_on_template_id"
  end

  create_table "datum_record_lists", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.jsonb "columns"
    t.datetime "created_at", null: false
    t.uuid "data_list_id"
    t.boolean "done"
    t.jsonb "parameters"
    t.datetime "updated_at", null: false
    t.index ["data_list_id"], name: "index_datum_record_lists_on_data_list_id"
  end

  create_table "datum_table_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "fields"
    t.uuid "table_list_id"
    t.datetime "updated_at", null: false
    t.index ["table_list_id"], name: "index_datum_table_items_on_table_list_id"
  end

  create_table "datum_table_lists", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "data_list_id"
    t.boolean "done"
    t.jsonb "extra"
    t.jsonb "footers"
    t.jsonb "headers"
    t.jsonb "parameters"
    t.boolean "published"
    t.integer "table_items_count"
    t.string "timestamp"
    t.datetime "updated_at", null: false
    t.index ["data_list_id"], name: "index_datum_table_lists_on_data_list_id"
  end

  create_table "datum_template_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "fields"
    t.integer "position"
    t.uuid "template_id"
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_datum_template_items_on_template_id"
  end

  create_table "datum_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.integer "header_line"
    t.jsonb "headers"
    t.string "name"
    t.uuid "organ_id"
    t.jsonb "parameters"
    t.integer "template_items_count"
    t.datetime "updated_at", null: false
    t.datetime "uploaded_at"
    t.index ["organ_id"], name: "index_datum_templates_on_organ_id"
  end

  create_table "datum_validations", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "fields"
    t.string "header"
    t.string "sheet"
    t.uuid "template_id"
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_datum_validations_on_template_id"
  end

  create_table "debug_manies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "one_id"
    t.datetime "updated_at", null: false
    t.index ["one_id"], name: "index_debug_manies_on_one_id"
  end

  create_table "debug_muches", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "debug_ones", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.string "state"
    t.datetime "updated_at", null: false
  end

  create_table "debug_throughs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "many_id"
    t.uuid "much_id"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["many_id"], name: "index_debug_throughs_on_many_id"
    t.index ["much_id"], name: "index_debug_throughs_on_much_id"
  end

  create_table "detail_contents", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "author_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.uuid "detail_id"
    t.string "detail_type"
    t.string "list"
    t.integer "position"
    t.string "title"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_detail_contents_on_author_id"
    t.index ["detail_type", "detail_id"], name: "index_detail_contents_on_detail"
  end

  create_table "detail_entity_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "entity_id"
    t.string "entity_type"
    t.uuid "item_id"
    t.uuid "list_id"
    t.uuid "taxon_item_id"
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["entity_type", "entity_id"], name: "index_detail_entity_items_on_entity"
    t.index ["item_id"], name: "index_detail_entity_items_on_item_id"
    t.index ["list_id"], name: "index_detail_entity_items_on_list_id"
    t.index ["taxon_item_id"], name: "index_detail_entity_items_on_taxon_item_id"
  end

  create_table "detail_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "key"
    t.uuid "list_id"
    t.string "name"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_detail_items_on_list_id"
  end

  create_table "detail_knowings", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "knowable_id"
    t.string "knowable_type"
    t.uuid "knowledge_id"
    t.boolean "primary"
    t.datetime "updated_at", null: false
    t.index ["knowable_type", "knowable_id"], name: "index_detail_knowings_on_knowable"
    t.index ["knowledge_id"], name: "index_detail_knowings_on_knowledge_id"
  end

  create_table "detail_knowledge_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "detail/knowledge_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_detail_knowledge_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_detail_knowledge_hierarchies_on_descendant_id"
  end

  create_table "detail_knowledges", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_detail_knowledges_on_parent_id"
  end

  create_table "detail_lists", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "items_count"
    t.string "name"
    t.uuid "organ_id"
    t.integer "position"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_detail_lists_on_organ_id"
  end

  create_table "detail_post_syncs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "post_id"
    t.string "source_id"
    t.datetime "synced_at"
    t.uuid "synced_id"
    t.string "synced_type"
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_detail_post_syncs_on_post_id"
    t.index ["synced_type", "synced_id"], name: "index_detail_post_syncs_on_synced"
  end

  create_table "detail_posts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.string "content"
    t.datetime "created_at", null: false
    t.string "link"
    t.uuid "organ_id"
    t.string "thumb_media_id"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_detail_posts_on_organ_id"
  end

  create_table "detail_taxon_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "default_value"
    t.uuid "item_id"
    t.uuid "list_id"
    t.uuid "taxon_id"
    t.string "taxon_type"
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_detail_taxon_items_on_item_id"
    t.index ["list_id"], name: "index_detail_taxon_items_on_list_id"
    t.index ["taxon_type", "taxon_id"], name: "index_detail_taxon_items_on_taxon"
  end

  create_table "doc_maps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "mappings"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "doc_subjects", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.string "note"
    t.jsonb "path_params"
    t.jsonb "request_body"
    t.jsonb "request_headers"
    t.jsonb "request_params"
    t.string "request_type"
    t.string "response_body"
    t.jsonb "response_headers"
    t.string "response_status"
    t.string "response_type"
    t.uuid "rule_id"
    t.datetime "updated_at", null: false
    t.index ["rule_id"], name: "index_doc_subjects_on_rule_id"
  end

  create_table "douyin_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "appid"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "open_id"
    t.uuid "organ_id"
    t.string "refresh_token"
    t.datetime "refresh_token_expires_at"
    t.string "secret"
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_douyin_apps_on_appid"
    t.index ["organ_id"], name: "index_douyin_apps_on_organ_id"
  end

  create_table "douyin_orders", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "account_id"
    t.string "appid"
    t.string "certificate_id"
    t.string "code"
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.string "origin_code"
    t.string "poi_id"
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.string "verify_id"
    t.jsonb "verify_results"
    t.string "verify_token"
  end

  create_table "douyin_shops", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "organ_id"
    t.string "poi_id"
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_douyin_shops_on_appid"
    t.index ["organ_id"], name: "index_douyin_shops_on_organ_id"
  end

  create_table "email_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "action_name"
    t.string "cc_to"
    t.datetime "created_at", null: false
    t.string "mail_from"
    t.string "mail_to"
    t.string "mailer"
    t.string "message_object_id"
    t.string "params"
    t.string "sent_status"
    t.string "sent_string"
    t.string "subject"
    t.uuid "template_id"
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_email_logs_on_template_id"
  end

  create_table "email_reasons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_smtp_accounts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "password"
    t.integer "position"
    t.uuid "smtp_id"
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.index ["position"], name: "index_email_smtp_accounts_on_position"
    t.index ["smtp_id"], name: "index_email_smtp_accounts_on_smtp_id"
  end

  create_table "email_smtps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "address"
    t.string "authentication"
    t.datetime "created_at", null: false
    t.boolean "enable_starttls_auto"
    t.string "openssl_verify_mode"
    t.string "port"
    t.boolean "ssl"
    t.datetime "updated_at", null: false
  end

  create_table "email_subscriptions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.uuid "reason_id"
    t.uuid "smtp_account_id"
    t.uuid "smtp_id"
    t.string "state"
    t.datetime "subscribe_at"
    t.datetime "unsubscribe_at"
    t.datetime "updated_at", null: false
    t.index ["reason_id"], name: "index_email_subscriptions_on_reason_id"
    t.index ["smtp_account_id"], name: "index_email_subscriptions_on_smtp_account_id"
    t.index ["smtp_id"], name: "index_email_subscriptions_on_smtp_id"
  end

  create_table "email_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "body"
    t.string "contact"
    t.datetime "created_at", null: false
    t.string "honorific"
    t.string "order_prefix"
    t.uuid "organ_id"
    t.integer "position"
    t.string "subject"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_email_templates_on_organ_id"
    t.index ["position"], name: "index_email_templates_on_position"
  end

  create_table "eventual_bookings", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "booked_id"
    t.string "booked_type"
    t.uuid "booker_id"
    t.string "booker_type"
    t.date "booking_on"
    t.datetime "created_at", null: false
    t.uuid "place_id"
    t.uuid "plan_item_id"
    t.uuid "seat_id"
    t.uuid "time_item_id"
    t.datetime "updated_at", null: false
    t.index ["booked_type", "booked_id"], name: "index_eventual_bookings_on_booked"
    t.index ["booker_type", "booker_id"], name: "index_eventual_bookings_on_booker"
    t.index ["place_id"], name: "index_eventual_bookings_on_place_id"
    t.index ["plan_item_id"], name: "index_eventual_bookings_on_plan_item_id"
    t.index ["seat_id"], name: "index_eventual_bookings_on_seat_id"
    t.index ["time_item_id"], name: "index_eventual_bookings_on_time_item_id"
  end

  create_table "eventual_crowd_members", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "agency_id"
    t.datetime "created_at", null: false
    t.uuid "crowd_id"
    t.uuid "member_id"
    t.string "member_type"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_eventual_crowd_members_on_agency_id"
    t.index ["crowd_id"], name: "index_eventual_crowd_members_on_crowd_id"
    t.index ["member_type", "member_id"], name: "index_eventual_crowd_members_on_member"
  end

  create_table "eventual_crowds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "crowd_members_count"
    t.string "member_type"
    t.string "name"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_eventual_crowds_on_organ_id"
  end

  create_table "eventual_event_crowds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "crowd_id"
    t.uuid "event_id"
    t.integer "present_number"
    t.datetime "updated_at", null: false
    t.index ["crowd_id"], name: "index_eventual_event_crowds_on_crowd_id"
    t.index ["event_id"], name: "index_eventual_event_crowds_on_event_id"
  end

  create_table "eventual_event_grants", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "event_id"
    t.jsonb "filter"
    t.string "grant_column"
    t.string "grant_kind"
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_eventual_event_grants_on_event_id"
  end

  create_table "eventual_event_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "author_id"
    t.datetime "created_at", null: false
    t.uuid "event_id"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_eventual_event_items_on_author_id"
    t.index ["event_id"], name: "index_eventual_event_items_on_event_id"
  end

  create_table "eventual_event_participants", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "assigned_status"
    t.string "comment"
    t.datetime "created_at", null: false
    t.uuid "crowd_member_id"
    t.uuid "event_crowd_id"
    t.uuid "event_id"
    t.string "job_id"
    t.uuid "participant_id"
    t.string "participant_type"
    t.string "quit_note"
    t.integer "score"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["crowd_member_id"], name: "index_eventual_event_participants_on_crowd_member_id"
    t.index ["event_crowd_id"], name: "index_eventual_event_participants_on_event_crowd_id"
    t.index ["event_id"], name: "index_eventual_event_participants_on_event_id"
    t.index ["participant_type", "participant_id"], name: "index_eventual_event_participants_on_participant"
  end

  create_table "eventual_event_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_eventual_event_taxons_on_organ_id"
  end

  create_table "eventual_events", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.date "begin_on"
    t.datetime "created_at", null: false
    t.string "description"
    t.date "end_on"
    t.integer "event_items_count"
    t.integer "event_participants_count"
    t.uuid "event_taxon_id"
    t.integer "members_count"
    t.string "name"
    t.uuid "organ_id"
    t.uuid "place_id"
    t.integer "position"
    t.boolean "produce_done"
    t.date "produced_begin_on"
    t.date "produced_end_on"
    t.integer "repeat_count", comment: "每几周/天"
    t.string "repeat_days", array: true
    t.string "repeat_type"
    t.uuid "time_list_id"
    t.datetime "updated_at", null: false
    t.index ["event_taxon_id"], name: "index_eventual_events_on_event_taxon_id"
    t.index ["organ_id"], name: "index_eventual_events_on_organ_id"
    t.index ["place_id"], name: "index_eventual_events_on_place_id"
    t.index ["time_list_id"], name: "index_eventual_events_on_time_list_id"
  end

  create_table "eventual_place_taxon_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "eventual/place_taxon_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_eventual_place_taxon_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_eventual_place_taxon_hierarchies_on_descendant_id"
  end

  create_table "eventual_place_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "organ_id"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.integer "places_count"
    t.integer "position"
    t.decimal "profit_margin"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_eventual_place_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_eventual_place_taxons_on_parent_id"
  end

  create_table "eventual_places", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "area_id"
    t.string "color"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.uuid "organ_id"
    t.jsonb "place_taxon_ancestors"
    t.uuid "place_taxon_id"
    t.integer "plans_count"
    t.integer "seats_count"
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_eventual_places_on_area_id"
    t.index ["organ_id"], name: "index_eventual_places_on_organ_id"
    t.index ["place_taxon_id"], name: "index_eventual_places_on_place_taxon_id"
  end

  create_table "eventual_plan_attenders", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.boolean "attended"
    t.uuid "attender_id"
    t.string "attender_type"
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.uuid "place_id"
    t.uuid "plan_id"
    t.uuid "plan_item_id"
    t.uuid "plan_participant_id"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["attender_type", "attender_id"], name: "index_eventual_plan_attenders_on_attender"
    t.index ["place_id"], name: "index_eventual_plan_attenders_on_place_id"
    t.index ["plan_id"], name: "index_eventual_plan_attenders_on_plan_id"
    t.index ["plan_item_id"], name: "index_eventual_plan_attenders_on_plan_item_id"
    t.index ["plan_participant_id"], name: "index_eventual_plan_attenders_on_plan_participant_id"
  end

  create_table "eventual_plan_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "bookings_count"
    t.datetime "created_at", null: false
    t.uuid "event_id"
    t.uuid "event_item_id"
    t.jsonb "extra"
    t.uuid "place_id"
    t.date "plan_on"
    t.integer "plan_participants_count"
    t.uuid "planned_id"
    t.string "planned_type"
    t.string "repeat_index"
    t.uuid "time_item_id"
    t.uuid "time_list_id"
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_eventual_plan_items_on_event_id"
    t.index ["event_item_id"], name: "index_eventual_plan_items_on_event_item_id"
    t.index ["place_id"], name: "index_eventual_plan_items_on_place_id"
    t.index ["planned_type", "planned_id"], name: "index_eventual_plan_items_on_planned"
    t.index ["time_item_id"], name: "index_eventual_plan_items_on_time_item_id"
    t.index ["time_list_id"], name: "index_eventual_plan_items_on_time_list_id"
  end

  create_table "eventual_plan_participants", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "event_participant_id"
    t.uuid "participant_id"
    t.string "participant_type"
    t.uuid "planning_id"
    t.string "planning_type"
    t.string "status", comment: "默认 event_participant 有效"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["event_participant_id"], name: "index_eventual_plan_participants_on_event_participant_id"
    t.index ["participant_type", "participant_id"], name: "index_eventual_plan_participants_on_participant"
    t.index ["planning_type", "planning_id"], name: "index_eventual_plan_participants_on_planning"
  end

  create_table "eventual_seats", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "max_members"
    t.integer "min_members"
    t.string "name"
    t.uuid "place_id"
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_eventual_seats_on_place_id"
  end

  create_table "eventual_time_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.time "finish_at"
    t.integer "position"
    t.time "start_at"
    t.uuid "time_list_id"
    t.datetime "updated_at", null: false
    t.index ["time_list_id"], name: "index_eventual_time_items_on_time_list_id"
  end

  create_table "eventual_time_lists", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.integer "interval_minutes"
    t.integer "item_minutes"
    t.string "kind"
    t.string "name"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_eventual_time_lists_on_organ_id"
  end

  create_table "factory_brands", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "organ_id"
    t.integer "products_count"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_brands_on_organ_id"
  end

  create_table "factory_component_parts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "component_id"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.integer "max"
    t.integer "min"
    t.uuid "part_id"
    t.uuid "product_id"
    t.uuid "taxon_id"
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_factory_component_parts_on_component_id"
    t.index ["part_id"], name: "index_factory_component_parts_on_part_id"
    t.index ["product_id"], name: "index_factory_component_parts_on_product_id"
    t.index ["taxon_id"], name: "index_factory_component_parts_on_taxon_id"
  end

  create_table "factory_components", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "component_parts_count"
    t.datetime "created_at", null: false
    t.integer "max_select"
    t.integer "min_select"
    t.boolean "multiple"
    t.string "name"
    t.uuid "part_taxon_id"
    t.uuid "product_id"
    t.uuid "taxon_id"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["part_taxon_id"], name: "index_factory_components_on_part_taxon_id"
    t.index ["product_id"], name: "index_factory_components_on_product_id"
    t.index ["taxon_id"], name: "index_factory_components_on_taxon_id"
  end

  create_table "factory_factory_providers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "factory_taxon_id"
    t.uuid "provider_id"
    t.datetime "updated_at", null: false
    t.index ["factory_taxon_id"], name: "index_factory_factory_providers_on_factory_taxon_id"
    t.index ["provider_id"], name: "index_factory_factory_providers_on_provider_id"
  end

  create_table "factory_factory_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "factory_providers_count"
    t.string "name"
    t.integer "position"
    t.uuid "scene_id"
    t.datetime "updated_at", null: false
    t.index ["scene_id"], name: "index_factory_factory_taxons_on_scene_id"
  end

  create_table "factory_fits", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "grade"
    t.uuid "part_brand_id"
    t.uuid "part_product_id"
    t.uuid "part_production_id"
    t.uuid "part_serial_id"
    t.uuid "product_id"
    t.uuid "production_id"
    t.datetime "updated_at", null: false
    t.index ["part_brand_id"], name: "index_factory_fits_on_part_brand_id"
    t.index ["part_product_id"], name: "index_factory_fits_on_part_product_id"
    t.index ["part_production_id"], name: "index_factory_fits_on_part_production_id"
    t.index ["part_serial_id"], name: "index_factory_fits_on_part_serial_id"
    t.index ["product_id"], name: "index_factory_fits_on_product_id"
    t.index ["production_id"], name: "index_factory_fits_on_production_id"
  end

  create_table "factory_part_plans", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "finish_at"
    t.uuid "part_id"
    t.uuid "product_id"
    t.uuid "production_id"
    t.integer "purchased_count"
    t.integer "received_count"
    t.datetime "start_at"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_factory_part_plans_on_part_id"
    t.index ["product_id"], name: "index_factory_part_plans_on_product_id"
    t.index ["production_id"], name: "index_factory_part_plans_on_production_id"
  end

  create_table "factory_produce_plans", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "book_finish_at"
    t.datetime "book_start_at"
    t.datetime "created_at", null: false
    t.uuid "organ_id"
    t.date "produce_on"
    t.integer "production_plans_count"
    t.uuid "scene_id"
    t.integer "serial_number"
    t.string "state"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_produce_plans_on_organ_id"
    t.index ["scene_id"], name: "index_factory_produce_plans_on_scene_id"
  end

  create_table "factory_produces", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "factory_product_produces", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "finish_at"
    t.integer "position"
    t.uuid "produce_id"
    t.uuid "product_id"
    t.datetime "start_at"
    t.datetime "updated_at", null: false
    t.index ["produce_id"], name: "index_factory_product_produces_on_produce_id"
    t.index ["product_id"], name: "index_factory_product_produces_on_product_id"
  end

  create_table "factory_product_provides", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "default"
    t.uuid "product_id"
    t.uuid "provide_id"
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_factory_product_provides_on_product_id"
    t.index ["provide_id"], name: "index_factory_product_provides_on_provide_id"
  end

  create_table "factory_production_carts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "cart_id"
    t.datetime "created_at", null: false
    t.datetime "customized_at"
    t.decimal "original_price"
    t.uuid "product_id"
    t.uuid "production_id"
    t.string "state"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["cart_id"], name: "index_factory_production_carts_on_cart_id"
    t.index ["product_id"], name: "index_factory_production_carts_on_product_id"
    t.index ["production_id"], name: "index_factory_production_carts_on_production_id"
    t.index ["user_id"], name: "index_factory_production_carts_on_user_id"
  end

  create_table "factory_production_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.uuid "building_id"
    t.datetime "came_at"
    t.string "code"
    t.datetime "created_at", null: false
    t.uuid "grid_id"
    t.uuid "product_item_id"
    t.uuid "production_id"
    t.uuid "room_id"
    t.string "state"
    t.uuid "station_id"
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_factory_production_items_on_building_id"
    t.index ["grid_id"], name: "index_factory_production_items_on_grid_id"
    t.index ["product_item_id"], name: "index_factory_production_items_on_product_item_id"
    t.index ["production_id"], name: "index_factory_production_items_on_production_id"
    t.index ["room_id"], name: "index_factory_production_items_on_room_id"
    t.index ["station_id"], name: "index_factory_production_items_on_station_id"
  end

  create_table "factory_production_parts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "component_id"
    t.datetime "created_at", null: false
    t.integer "number"
    t.uuid "part_id"
    t.uuid "part_taxon_id"
    t.uuid "product_id"
    t.uuid "production_id"
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_factory_production_parts_on_component_id"
    t.index ["part_id"], name: "index_factory_production_parts_on_part_id"
    t.index ["part_taxon_id"], name: "index_factory_production_parts_on_part_taxon_id"
    t.index ["product_id"], name: "index_factory_production_parts_on_product_id"
    t.index ["production_id"], name: "index_factory_production_parts_on_production_id"
  end

  create_table "factory_production_plans", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "finish_at"
    t.uuid "organ_id"
    t.integer "planned_count"
    t.date "produce_on"
    t.uuid "product_id"
    t.uuid "production_id"
    t.integer "production_items_count"
    t.uuid "scene_id"
    t.boolean "specialty", comment: "主推"
    t.datetime "start_at"
    t.string "state"
    t.uuid "station_id"
    t.integer "trade_items_count"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_production_plans_on_organ_id"
    t.index ["product_id"], name: "index_factory_production_plans_on_product_id"
    t.index ["production_id"], name: "index_factory_production_plans_on_production_id"
    t.index ["scene_id"], name: "index_factory_production_plans_on_scene_id"
    t.index ["station_id"], name: "index_factory_production_plans_on_station_id"
  end

  create_table "factory_production_provides", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "cost_price"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.uuid "product_id"
    t.uuid "production_id"
    t.uuid "provide_config_id"
    t.string "provide_config_type"
    t.uuid "provide_id"
    t.uuid "taxon_id"
    t.datetime "updated_at", null: false
    t.uuid "upstream_product_id"
    t.uuid "upstream_production_id"
    t.index ["product_id"], name: "index_factory_production_provides_on_product_id"
    t.index ["production_id"], name: "index_factory_production_provides_on_production_id"
    t.index ["provide_config_type", "provide_config_id"], name: "index_factory_production_provides_on_provide_config"
    t.index ["provide_id"], name: "index_factory_production_provides_on_provide_id"
    t.index ["taxon_id"], name: "index_factory_production_provides_on_taxon_id"
    t.index ["upstream_product_id"], name: "index_factory_production_provides_on_upstream_product_id"
    t.index ["upstream_production_id"], name: "index_factory_production_provides_on_upstream_production_id"
  end

  create_table "factory_production_spaces", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "building_id"
    t.datetime "created_at", null: false
    t.uuid "desk_id"
    t.uuid "grid_id"
    t.uuid "production_id"
    t.uuid "room_id"
    t.uuid "station_id"
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_factory_production_spaces_on_building_id"
    t.index ["desk_id"], name: "index_factory_production_spaces_on_desk_id"
    t.index ["grid_id"], name: "index_factory_production_spaces_on_grid_id"
    t.index ["production_id"], name: "index_factory_production_spaces_on_production_id"
    t.index ["room_id"], name: "index_factory_production_spaces_on_room_id"
    t.index ["station_id"], name: "index_factory_production_spaces_on_station_id"
  end

  create_table "factory_productions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "advance_price"
    t.boolean "automatic"
    t.jsonb "card_price"
    t.decimal "cost_price", comment: "成本价"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.boolean "enabled"
    t.jsonb "extra"
    t.uuid "factory_taxon_id"
    t.string "good_type"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.jsonb "last_stock_log"
    t.string "link"
    t.string "name"
    t.uuid "organ_id"
    t.integer "position"
    t.boolean "presell", comment: "预售"
    t.decimal "price"
    t.uuid "product_host_id"
    t.uuid "product_id"
    t.decimal "profit_price", comment: "利润"
    t.string "qr_code"
    t.decimal "quantity"
    t.integer "rent_charges_count"
    t.string "rent_unit"
    t.string "sku"
    t.string "state"
    t.decimal "step", comment: "Item Number Step"
    t.decimal "stock"
    t.string "str_part_ids"
    t.uuid "taxon_id"
    t.decimal "unified_quantity"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.jsonb "wallet_price"
    t.string "word", comment: "搜索关键词"
    t.index ["factory_taxon_id"], name: "index_factory_productions_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_productions_on_organ_id"
    t.index ["product_host_id"], name: "index_factory_productions_on_product_host_id"
    t.index ["product_id"], name: "index_factory_productions_on_product_id"
    t.index ["str_part_ids"], name: "index_factory_productions_on_str_part_ids"
    t.index ["taxon_id"], name: "index_factory_productions_on_taxon_id"
  end

  create_table "factory_products", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "base_price"
    t.uuid "brand_id"
    t.datetime "created_at", null: false
    t.string "description"
    t.uuid "factory_taxon_id"
    t.integer "fits_count"
    t.decimal "max_price"
    t.decimal "min_price"
    t.string "name"
    t.integer "order_items_count"
    t.uuid "organ_id"
    t.integer "position"
    t.integer "product_parts_count"
    t.integer "productions_count"
    t.decimal "profit_margin"
    t.boolean "published"
    t.string "qr_prefix"
    t.string "sku"
    t.boolean "specialty"
    t.jsonb "taxon_ancestors"
    t.uuid "taxon_id"
    t.uuid "unifier_id"
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_factory_products_on_brand_id"
    t.index ["factory_taxon_id"], name: "index_factory_products_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_products_on_organ_id"
    t.index ["sku"], name: "index_factory_products_on_sku"
    t.index ["taxon_id"], name: "index_factory_products_on_taxon_id"
    t.index ["unifier_id"], name: "index_factory_products_on_unifier_id"
  end

  create_table "factory_provides", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "factory_provider_id"
    t.string "invite_token"
    t.string "name"
    t.uuid "organ_id"
    t.uuid "provider_id"
    t.datetime "updated_at", null: false
    t.index ["factory_provider_id"], name: "index_factory_provides_on_factory_provider_id"
    t.index ["organ_id"], name: "index_factory_provides_on_organ_id"
    t.index ["provider_id"], name: "index_factory_provides_on_provider_id"
  end

  create_table "factory_scene_automatics", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "advance_days"
    t.datetime "created_at", null: false
    t.uuid "organ_id"
    t.uuid "scene_id"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_scene_automatics_on_organ_id"
    t.index ["scene_id"], name: "index_factory_scene_automatics_on_scene_id"
  end

  create_table "factory_scenes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.time "book_finish_at"
    t.integer "book_finish_days"
    t.time "book_start_at"
    t.integer "book_start_days"
    t.datetime "created_at", null: false
    t.time "deliver_finish_at"
    t.time "deliver_start_at"
    t.uuid "organ_id"
    t.boolean "specialty"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_scenes_on_organ_id"
  end

  create_table "factory_serial_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "factory/serial_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_factory_serial_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_factory_serial_hierarchies_on_descendant_id"
  end

  create_table "factory_serials", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "brand_id"
    t.datetime "created_at", null: false
    t.string "name"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.integer "position"
    t.integer "products_count"
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_factory_serials_on_brand_id"
    t.index ["parent_id"], name: "index_factory_serials_on_parent_id"
  end

  create_table "factory_stock_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.uuid "production_id"
    t.uuid "source_id"
    t.string "source_type"
    t.decimal "stock"
    t.string "tag_str"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["production_id"], name: "index_factory_stock_logs_on_production_id"
    t.index ["source_type", "source_id"], name: "index_factory_stock_logs_on_source"
  end

  create_table "factory_taxon_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "factory/taxon_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_factory_taxon_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_factory_taxon_hierarchies_on_descendant_id"
  end

  create_table "factory_taxon_provides", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "default"
    t.uuid "provide_id"
    t.uuid "taxon_id"
    t.datetime "updated_at", null: false
    t.index ["provide_id"], name: "index_factory_taxon_provides_on_provide_id"
    t.index ["taxon_id"], name: "index_factory_taxon_provides_on_taxon_id"
  end

  create_table "factory_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.boolean "countable", comment: "可盘点"
    t.datetime "created_at", null: false
    t.boolean "customizable", comment: "可定制"
    t.boolean "enabled"
    t.uuid "factory_taxon_id"
    t.string "name"
    t.boolean "nav", comment: "单独分类"
    t.uuid "organ_id"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.integer "position"
    t.integer "products_count"
    t.integer "provides_count"
    t.uuid "scene_id"
    t.integer "taxon_components_count"
    t.datetime "updated_at", null: false
    t.index ["factory_taxon_id"], name: "index_factory_taxons_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_factory_taxons_on_parent_id"
    t.index ["scene_id"], name: "index_factory_taxons_on_scene_id"
  end

  create_table "factory_unifiers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "finance_assessments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.uuid "organ_id"
    t.decimal "trustee_amount"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_finance_assessments_on_organ_id"
  end

  create_table "finance_budgets", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.uuid "financial_id"
    t.uuid "financial_taxon_id"
    t.string "financial_type"
    t.uuid "fund_id"
    t.uuid "member_id"
    t.string "note"
    t.uuid "organ_id"
    t.string "state"
    t.uuid "stock_id"
    t.string "subject"
    t.uuid "task_id"
    t.string "type"
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
    t.decimal "amount"
    t.decimal "budget_amount"
    t.uuid "budget_id"
    t.datetime "created_at", null: false
    t.uuid "expense_id"
    t.uuid "financial_taxon_id"
    t.string "note"
    t.decimal "price"
    t.integer "quantity"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_finance_expense_items_on_budget_id"
    t.index ["expense_id"], name: "index_finance_expense_items_on_expense_id"
    t.index ["financial_taxon_id"], name: "index_finance_expense_items_on_financial_taxon_id"
  end

  create_table "finance_expense_members", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "advance"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.uuid "expense_id"
    t.uuid "member_id"
    t.string "note"
    t.uuid "payment_method_id"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_finance_expense_members_on_expense_id"
    t.index ["member_id"], name: "index_finance_expense_members_on_member_id"
    t.index ["payment_method_id"], name: "index_finance_expense_members_on_payment_method_id"
  end

  create_table "finance_expenses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.uuid "budget_id"
    t.datetime "created_at", null: false
    t.uuid "creator_id"
    t.uuid "financial_id"
    t.uuid "financial_taxon_id"
    t.string "financial_type"
    t.uuid "fund_id"
    t.integer "invoices_count"
    t.string "note"
    t.uuid "organ_id"
    t.uuid "payment_method_id"
    t.uuid "payout_id"
    t.string "state"
    t.uuid "stock_id"
    t.string "subject"
    t.string "type"
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
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.uuid "financial_id"
    t.string "financial_type"
    t.uuid "fund_id"
    t.string "note"
    t.string "state"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.boolean "visible"
    t.index ["financial_type", "financial_id"], name: "index_finance_fund_incomes_on_financial"
    t.index ["fund_id"], name: "index_finance_fund_incomes_on_fund_id"
    t.index ["user_id"], name: "index_finance_fund_incomes_on_user_id"
  end

  create_table "finance_funds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "advance_price"
    t.decimal "amount"
    t.decimal "budget_amount"
    t.jsonb "budget_detail"
    t.jsonb "card_price"
    t.datetime "created_at", null: false
    t.decimal "expense_amount"
    t.jsonb "expense_detail"
    t.jsonb "extra"
    t.string "good_type"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.string "name"
    t.string "note"
    t.uuid "organ_id"
    t.decimal "price"
    t.decimal "quantity"
    t.string "sku"
    t.decimal "step", comment: "Item Number Step"
    t.decimal "unified_quantity"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.jsonb "wallet_price"
    t.index ["organ_id"], name: "index_finance_funds_on_organ_id"
    t.index ["user_id"], name: "index_finance_funds_on_user_id"
  end

  create_table "finance_stocks", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "amount", comment: "发行量"
    t.decimal "assess_amount"
    t.uuid "assessment_id"
    t.datetime "created_at", null: false
    t.integer "expense_amount"
    t.jsonb "expense_detail"
    t.uuid "member_id"
    t.string "note"
    t.uuid "organ_id"
    t.decimal "ratio"
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_finance_stocks_on_assessment_id"
    t.index ["member_id"], name: "index_finance_stocks_on_member_id"
    t.index ["organ_id"], name: "index_finance_stocks_on_organ_id"
  end

  create_table "finance_taxon_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "finance/taxon_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_finance_taxon_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_finance_taxon_hierarchies_on_descendant_id"
  end

  create_table "finance_taxons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "individual", comment: "是否可盘点"
    t.string "name"
    t.uuid "organ_id"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.integer "position"
    t.boolean "take_stock", comment: "是否有库存"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_finance_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_finance_taxons_on_parent_id"
  end

  create_table "growth_aim_codes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "action_name"
    t.uuid "aim_id"
    t.string "code", null: false
    t.string "controller_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aim_id"], name: "index_growth_aim_codes_on_aim_id"
  end

  create_table "growth_aim_entities", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "aim_id"
    t.integer "aim_logs_count"
    t.datetime "created_at", null: false
    t.uuid "entity_id"
    t.string "entity_type"
    t.string "ip"
    t.datetime "last_access_at"
    t.integer "present_point"
    t.decimal "reward_amount"
    t.uuid "reward_expense_id"
    t.string "state"
    t.string "text_date"
    t.string "text_month"
    t.string "text_week"
    t.string "text_year"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["aim_id"], name: "index_growth_aim_entities_on_aim_id"
    t.index ["entity_type", "entity_id"], name: "index_growth_aim_entities_on_entity"
    t.index ["reward_expense_id"], name: "index_growth_aim_entities_on_reward_expense_id"
    t.index ["user_id"], name: "index_growth_aim_entities_on_user_id"
  end

  create_table "growth_aim_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "aim_id"
    t.string "code"
    t.datetime "created_at", null: false
    t.uuid "entity_id"
    t.string "entity_type"
    t.string "ip"
    t.boolean "rewarded"
    t.string "serial_number"
    t.uuid "user_id"
    t.index ["aim_id"], name: "index_growth_aim_logs_on_aim_id"
    t.index ["entity_type", "entity_id"], name: "index_growth_aim_logs_on_entity"
    t.index ["user_id"], name: "index_growth_aim_logs_on_user_id"
  end

  create_table "growth_aim_users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "aim_entities_count"
    t.uuid "aim_id"
    t.datetime "created_at", null: false
    t.integer "reward_amount"
    t.string "state"
    t.string "text_date"
    t.string "text_month"
    t.string "text_week"
    t.string "text_year"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["aim_id"], name: "index_growth_aim_users_on_aim_id"
    t.index ["user_id"], name: "index_growth_aim_users_on_user_id"
  end

  create_table "growth_aims", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.decimal "rate"
    t.string "repeat_type"
    t.integer "reward_amount"
    t.integer "reward_point"
    t.integer "task_point"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.boolean "verbose"
  end

  create_table "growth_praise_incomes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount", comment: "用户打赏"
    t.datetime "created_at", null: false
    t.uuid "earner_id"
    t.decimal "profit_amount", comment: "平台收入"
    t.decimal "reward_amount", comment: "赏金池"
    t.uuid "reward_id"
    t.decimal "royalty_amount", comment: "作者分成"
    t.uuid "source_id"
    t.string "source_type"
    t.string "state"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["earner_id"], name: "index_growth_praise_incomes_on_earner_id"
    t.index ["reward_id"], name: "index_growth_praise_incomes_on_reward_id"
    t.index ["source_type", "source_id"], name: "index_growth_praise_incomes_on_source"
    t.index ["user_id"], name: "index_growth_praise_incomes_on_user_id"
  end

  create_table "growth_praise_users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.uuid "entity_id"
    t.string "entity_type"
    t.integer "position"
    t.uuid "reward_id"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["entity_type", "entity_id"], name: "index_growth_praise_users_on_entity"
    t.index ["reward_id"], name: "index_growth_praise_users_on_reward_id"
    t.index ["user_id"], name: "index_growth_praise_users_on_user_id"
  end

  create_table "growth_reward_expenses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "aim_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.uuid "reward_id"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["aim_id"], name: "index_growth_reward_expenses_on_aim_id"
    t.index ["reward_id"], name: "index_growth_reward_expenses_on_reward_id"
    t.index ["user_id"], name: "index_growth_reward_expenses_on_user_id"
  end

  create_table "growth_reward_incomes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "reward_amount"
    t.uuid "reward_id"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["reward_id"], name: "index_growth_reward_incomes_on_reward_id"
    t.index ["user_id"], name: "index_growth_reward_incomes_on_user_id"
  end

  create_table "growth_rewards", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.boolean "enabled"
    t.uuid "entity_id"
    t.string "entity_type"
    t.decimal "expense_amount"
    t.datetime "finish_at"
    t.decimal "income_amount"
    t.integer "lock_version"
    t.decimal "max_piece"
    t.decimal "min_piece"
    t.datetime "start_at"
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_growth_rewards_on_entity"
  end

  create_table "interact_abuses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "abusement_id"
    t.string "abusement_type"
    t.datetime "created_at", null: false
    t.string "note"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["abusement_type", "abusement_id"], name: "index_interact_abuses_on_abusement"
    t.index ["user_id"], name: "index_interact_abuses_on_user_id"
  end

  create_table "interact_attitudes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "attitudinal_id"
    t.string "attitudinal_type"
    t.datetime "created_at", null: false
    t.string "opinion"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["attitudinal_type", "attitudinal_id"], name: "index_interact_attitudes_on_attitudinal"
    t.index ["user_id"], name: "index_interact_attitudes_on_user_id"
  end

  create_table "interact_comments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "commentable_id"
    t.string "commentable_type"
    t.string "content"
    t.datetime "created_at", null: false
    t.integer "liked_count"
    t.uuid "parent_id"
    t.float "score"
    t.integer "star_count"
    t.string "state"
    t.string "title"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["commentable_type", "commentable_id"], name: "index_interact_comments_on_commentable"
    t.index ["parent_id"], name: "index_interact_comments_on_parent_id"
    t.index ["user_id"], name: "index_interact_comments_on_user_id"
  end

  create_table "interact_stars", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "starred_id"
    t.string "starred_type"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["starred_type", "starred_id"], name: "index_interact_stars_on_starred"
    t.index ["user_id"], name: "index_interact_stars_on_user_id"
  end

  create_table "markdown_assets", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "download_url"
    t.uuid "git_id"
    t.string "name"
    t.string "path"
    t.string "sha"
    t.datetime "updated_at", null: false
    t.index ["git_id"], name: "index_markdown_assets_on_git_id"
  end

  create_table "markdown_catalogs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "depth"
    t.uuid "git_id"
    t.string "home_path"
    t.string "name"
    t.boolean "nav", comment: "是否导航菜单"
    t.uuid "organ_id"
    t.string "parent_path"
    t.string "path"
    t.integer "position"
    t.datetime "updated_at", null: false
    t.index ["git_id"], name: "index_markdown_catalogs_on_git_id"
    t.index ["organ_id"], name: "index_markdown_catalogs_on_organ_id"
  end

  create_table "markdown_gits", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "base_name"
    t.datetime "created_at", null: false
    t.string "identity"
    t.datetime "last_commit_at"
    t.string "last_commit_message"
    t.uuid "organ_id"
    t.string "remote_url"
    t.string "secret"
    t.string "type"
    t.datetime "updated_at", null: false
    t.string "working_directory"
    t.index ["organ_id"], name: "index_markdown_gits_on_organ_id"
  end

  create_table "markdown_posts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "catalog_path"
    t.datetime "created_at", null: false
    t.uuid "git_id"
    t.string "html"
    t.datetime "last_commit_at"
    t.string "layout"
    t.string "markdown"
    t.boolean "nav", comment: "是否导航菜单"
    t.string "oid"
    t.uuid "organ_id"
    t.string "path"
    t.boolean "ppt"
    t.boolean "published"
    t.boolean "shared"
    t.string "slug"
    t.string "target"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["git_id"], name: "index_markdown_posts_on_git_id"
    t.index ["organ_id"], name: "index_markdown_posts_on_organ_id"
  end

  create_table "notice_announcement_departments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "announce_at"
    t.uuid "announcement_id"
    t.datetime "created_at", null: false
    t.uuid "department_id"
    t.integer "notifications_count"
    t.uuid "organ_id"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_notice_announcement_departments_on_announcement_id"
    t.index ["department_id"], name: "index_notice_announcement_departments_on_department_id"
    t.index ["organ_id"], name: "index_notice_announcement_departments_on_organ_id"
  end

  create_table "notice_announcement_job_titles", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "announce_at"
    t.uuid "announcement_id"
    t.datetime "created_at", null: false
    t.uuid "department_id"
    t.uuid "job_title_id"
    t.integer "notifications_count"
    t.uuid "organ_id"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_notice_announcement_job_titles_on_announcement_id"
    t.index ["department_id"], name: "index_notice_announcement_job_titles_on_department_id"
    t.index ["job_title_id"], name: "index_notice_announcement_job_titles_on_job_title_id"
    t.index ["organ_id"], name: "index_notice_announcement_job_titles_on_organ_id"
  end

  create_table "notice_announcement_organs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "announce_at"
    t.uuid "announcement_id"
    t.datetime "created_at", null: false
    t.integer "notifications_count"
    t.uuid "organ_id"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_notice_announcement_organs_on_announcement_id"
    t.index ["organ_id"], name: "index_notice_announcement_organs_on_organ_id"
  end

  create_table "notice_announcement_user_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "announce_at"
    t.uuid "announcement_id"
    t.datetime "created_at", null: false
    t.integer "notifications_count"
    t.string "state"
    t.datetime "updated_at", null: false
    t.uuid "user_tag_id"
    t.index ["announcement_id"], name: "index_notice_announcement_user_tags_on_announcement_id"
    t.index ["user_tag_id"], name: "index_notice_announcement_user_tags_on_user_tag_id"
  end

  create_table "notice_announcements", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.string "link"
    t.integer "notifications_count"
    t.uuid "organ_id"
    t.uuid "publisher_id"
    t.string "publisher_type"
    t.integer "readed_count"
    t.string "title"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_notice_announcements_on_organ_id"
    t.index ["publisher_type", "publisher_id"], name: "index_notice_announcements_on_publisher"
  end

  create_table "notice_notification_sendings", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "notification_id"
    t.datetime "sent_at"
    t.string "sent_result"
    t.string "sent_to"
    t.datetime "updated_at", null: false
    t.string "way"
    t.index ["notification_id"], name: "index_notice_notification_sendings_on_notification_id"
  end

  create_table "notice_notifications", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.boolean "archived"
    t.string "body"
    t.string "code"
    t.datetime "created_at", null: false
    t.string "link"
    t.uuid "linked_id"
    t.string "linked_type"
    t.uuid "notifiable_id"
    t.string "notifiable_type"
    t.boolean "official"
    t.uuid "organ_id"
    t.datetime "read_at"
    t.integer "receiver_id"
    t.uuid "sender_id"
    t.string "sender_type"
    t.datetime "sending_at"
    t.string "state"
    t.string "title"
    t.string "type"
    t.boolean "verbose"
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
    t.datetime "created_at", null: false
    t.boolean "default"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_one_ai_app_models_on_app_id"
  end

  create_table "one_ai_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.string "base_url"
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "organ_id"
    t.integer "position"
    t.string "secret"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_one_ai_apps_on_appid"
    t.index ["organ_id"], name: "index_one_ai_apps_on_organ_id"
  end

  create_table "one_ai_chats", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "one_ai_messages", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "chat_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_one_ai_messages_on_chat_id"
  end

  create_table "one_ai_system_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "app_id"
    t.datetime "created_at", null: false
    t.uuid "system_id"
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_one_ai_system_apps_on_app_id"
    t.index ["system_id"], name: "index_one_ai_system_apps_on_system_id"
  end

  create_table "one_ai_systems", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "org_department_grants", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "department_id"
    t.uuid "job_title_id"
    t.uuid "organ_handle_id"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_org_department_grants_on_department_id"
    t.index ["job_title_id"], name: "index_org_department_grants_on_job_title_id"
    t.index ["organ_handle_id"], name: "index_org_department_grants_on_organ_handle_id"
    t.index ["organ_id"], name: "index_org_department_grants_on_organ_id"
  end

  create_table "org_department_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "org/department_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_org_department_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_org_department_hierarchies_on_descendant_id"
  end

  create_table "org_departments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "all_member_departments_count"
    t.datetime "created_at", null: false
    t.integer "member_departments_count"
    t.string "name"
    t.integer "needed_number"
    t.uuid "organ_id"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.jsonb "superior_ancestors"
    t.uuid "superior_id"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_org_departments_on_organ_id"
    t.index ["parent_id"], name: "index_org_departments_on_parent_id"
    t.index ["superior_id"], name: "index_org_departments_on_superior_id"
  end

  create_table "org_job_titles", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "department_id"
    t.uuid "department_root_id"
    t.string "description"
    t.integer "grade"
    t.integer "limit_member"
    t.string "name"
    t.integer "super_grade"
    t.uuid "super_job_title_id"
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_org_job_titles_on_department_id"
    t.index ["department_root_id"], name: "index_org_job_titles_on_department_root_id"
    t.index ["super_job_title_id"], name: "index_org_job_titles_on_super_job_title_id"
  end

  create_table "org_job_transfers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "from_department_id"
    t.uuid "from_job_title_id"
    t.uuid "member_id"
    t.string "reason_note"
    t.string "state"
    t.uuid "to_department_id"
    t.uuid "to_job_title_id"
    t.date "transfer_on"
    t.datetime "updated_at", null: false
    t.index ["from_department_id"], name: "index_org_job_transfers_on_from_department_id"
    t.index ["from_job_title_id"], name: "index_org_job_transfers_on_from_job_title_id"
    t.index ["member_id"], name: "index_org_job_transfers_on_member_id"
    t.index ["to_department_id"], name: "index_org_job_transfers_on_to_department_id"
    t.index ["to_job_title_id"], name: "index_org_job_transfers_on_to_job_title_id"
  end

  create_table "org_member_departments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "department_ancestors"
    t.uuid "department_id"
    t.integer "department_root_id"
    t.integer "grade"
    t.uuid "job_title_id"
    t.uuid "member_id"
    t.integer "superior_id"
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_org_member_departments_on_department_id"
    t.index ["job_title_id"], name: "index_org_member_departments_on_job_title_id"
    t.index ["member_id"], name: "index_org_member_departments_on_member_id"
  end

  create_table "org_members", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.boolean "accept_email"
    t.string "attendance_number"
    t.uuid "cache_id"
    t.string "corp_userid"
    t.jsonb "counters"
    t.datetime "created_at", null: false
    t.jsonb "department_ancestors"
    t.boolean "enabled"
    t.string "experience"
    t.string "identity"
    t.boolean "inviter"
    t.date "join_on"
    t.integer "maintains_count"
    t.uuid "member_inviter_id"
    t.string "name"
    t.string "notifiable_types"
    t.string "number"
    t.uuid "organ_id"
    t.integer "organ_root_id"
    t.boolean "owned"
    t.integer "pomodoro"
    t.integer "promote_goods_count"
    t.integer "showtime"
    t.string "state"
    t.datetime "updated_at", null: false
    t.string "wechat_openid"
    t.index ["cache_id"], name: "index_org_members_on_cache_id"
    t.index ["identity"], name: "index_org_members_on_identity"
    t.index ["member_inviter_id"], name: "index_org_members_on_member_inviter_id"
    t.index ["organ_id"], name: "index_org_members_on_organ_id"
  end

  create_table "org_organ_domains", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "beian", comment: "备案号"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.string "domain"
    t.string "host"
    t.string "kind"
    t.uuid "organ_id"
    t.string "redirect_action", comment: "默认跳转"
    t.string "redirect_controller"
    t.string "scheme"
    t.string "subdomain"
    t.datetime "updated_at", null: false
    t.index ["host"], name: "index_org_organ_domains_on_host"
    t.index ["organ_id"], name: "index_org_organ_domains_on_organ_id"
  end

  create_table "org_organ_handles", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.string "record_class"
    t.string "record_column"
    t.datetime "updated_at", null: false
  end

  create_table "org_organ_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "org/organ_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_org_organ_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_org_organ_hierarchies_on_descendant_id"
  end

  create_table "org_organs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "address"
    t.string "appid"
    t.jsonb "area_ancestors"
    t.uuid "area_id"
    t.uuid "cache_id"
    t.string "code"
    t.uuid "corp_user_id"
    t.jsonb "counters", default: {}
    t.datetime "created_at", null: false
    t.boolean "debug_enabled"
    t.string "dispatch"
    t.boolean "joinable", comment: "是否可搜索并加入"
    t.string "license"
    t.integer "limit_wechat"
    t.integer "limit_wechat_menu"
    t.integer "members_count"
    t.string "name"
    t.string "name_short"
    t.boolean "official", comment: "是否官方"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.boolean "production_enabled"
    t.uuid "provider_id"
    t.string "service_url", comment: "客服 url"
    t.jsonb "theme_settings"
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_org_organs_on_area_id"
    t.index ["cache_id"], name: "index_org_organs_on_cache_id"
    t.index ["corp_user_id"], name: "index_org_organs_on_corp_user_id"
    t.index ["parent_id"], name: "index_org_organs_on_parent_id"
    t.index ["provider_id"], name: "index_org_organs_on_provider_id"
  end

  create_table "org_resign_reasons", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "position"
    t.integer "resigns_count"
    t.datetime "updated_at", null: false
  end

  create_table "org_resign_references", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "resign_id"
    t.uuid "resign_reason_id"
    t.datetime "updated_at", null: false
    t.index ["resign_id"], name: "index_org_resign_references_on_resign_id"
    t.index ["resign_reason_id"], name: "index_org_resign_references_on_resign_reason_id"
  end

  create_table "org_resigns", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.string "handover_note"
    t.date "leave_on"
    t.uuid "member_id"
    t.string "reason_note"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_org_resigns_on_member_id"
  end

  create_table "org_shortcuts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "action"
    t.string "business"
    t.string "controller"
    t.datetime "created_at", null: false
    t.uuid "member_id"
    t.string "namespace"
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_org_shortcuts_on_member_id"
  end

  create_table "org_super_job_titles", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.integer "grade"
    t.string "name"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_org_super_job_titles_on_organ_id"
  end

  create_table "org_supports", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.jsonb "department_ancestors"
    t.uuid "department_id"
    t.integer "grade"
    t.uuid "member_id"
    t.string "name"
    t.uuid "organ_id"
    t.uuid "supporter_id"
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_org_supports_on_department_id"
    t.index ["member_id"], name: "index_org_supports_on_member_id"
    t.index ["organ_id"], name: "index_org_supports_on_organ_id"
    t.index ["supporter_id"], name: "index_org_supports_on_supporter_id"
  end

  create_table "org_tutorials", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "accepted_status"
    t.integer "allowance"
    t.string "comment"
    t.datetime "created_at", null: false
    t.date "finish_on"
    t.string "kind"
    t.uuid "member_id"
    t.string "note"
    t.string "performance"
    t.date "start_on"
    t.string "state"
    t.uuid "tutor_id"
    t.datetime "updated_at", null: false
    t.string "verified"
    t.index ["member_id"], name: "index_org_tutorials_on_member_id"
    t.index ["tutor_id"], name: "index_org_tutorials_on_tutor_id"
  end

  create_table "print_devices", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "aim"
    t.datetime "created_at", null: false
    t.uuid "organ_id"
    t.uuid "printer_id"
    t.string "printer_type"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_print_devices_on_organ_id"
    t.index ["printer_type", "printer_id"], name: "index_print_devices_on_printer"
  end

  create_table "print_jia_bo_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "api_key"
    t.datetime "created_at", null: false
    t.integer "jia_bo_printers_count"
    t.string "member_code"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "print_jia_bo_printers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "cmd_type"
    t.datetime "created_at", null: false
    t.string "dev_id"
    t.string "dev_name"
    t.string "device_id"
    t.string "grp_id"
    t.uuid "jia_bo_app_id"
    t.boolean "online"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.index ["jia_bo_app_id"], name: "index_print_jia_bo_printers_on_jia_bo_app_id"
    t.index ["organ_id"], name: "index_print_jia_bo_printers_on_organ_id"
  end

  create_table "print_mqtt_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "base_url"
    t.datetime "created_at", null: false
    t.string "key"
    t.string "secret"
    t.datetime "updated_at", null: false
  end

  create_table "print_printers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "organ_id"
    t.string "uid"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_print_printers_on_organ_id"
  end

  create_table "roled_cache_roles", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "cache_id"
    t.datetime "created_at", null: false
    t.uuid "role_id"
    t.datetime "updated_at", null: false
    t.index ["cache_id"], name: "index_roled_cache_roles_on_cache_id"
    t.index ["role_id"], name: "index_roled_cache_roles_on_role_id"
  end

  create_table "roled_caches", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "role_hash"
    t.string "str_role_ids"
    t.datetime "updated_at", null: false
    t.index ["str_role_ids"], name: "index_roled_caches_on_str_role_ids"
  end

  create_table "roled_role_rules", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "action_name"
    t.string "business_identifier"
    t.string "controller_path"
    t.datetime "created_at", null: false
    t.uuid "meta_action_id"
    t.string "namespace_identifier"
    t.string "params_identifier"
    t.string "params_name"
    t.uuid "role_id"
    t.datetime "updated_at", null: false
    t.index ["meta_action_id"], name: "index_roled_role_rules_on_meta_action_id"
    t.index ["role_id"], name: "index_roled_role_rules_on_role_id"
  end

  create_table "roled_role_types", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "role_id"
    t.datetime "updated_at", null: false
    t.string "who_type"
    t.index ["role_id"], name: "index_roled_role_types_on_role_id"
  end

  create_table "roled_role_whos", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "role_id"
    t.datetime "updated_at", null: false
    t.uuid "who_id"
    t.string "who_type"
    t.index ["role_id"], name: "index_roled_role_whos_on_role_id"
    t.index ["who_type", "who_id"], name: "index_roled_role_whos_on_who"
  end

  create_table "roled_roles", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "default"
    t.string "description"
    t.string "name"
    t.uuid "organ_id"
    t.jsonb "role_hash"
    t.string "tip"
    t.datetime "updated_at", null: false
    t.boolean "visible"
    t.index ["organ_id"], name: "index_roled_roles_on_organ_id"
  end

  create_table "roled_tabs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "icon"
    t.string "name"
    t.string "namespace"
    t.string "path"
    t.integer "position"
    t.uuid "role_id"
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roled_tabs_on_role_id"
  end

  create_table "ship_address_uses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "address_id"
    t.datetime "created_at", null: false
    t.string "kind"
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_ship_address_uses_on_address_id"
  end

  create_table "ship_addresses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "agent_id"
    t.jsonb "area_ancestors"
    t.uuid "area_id"
    t.string "cached_key"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.string "contact_person"
    t.datetime "created_at", null: false
    t.string "detail"
    t.string "floor", comment: "楼层"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.string "name"
    t.uuid "organ_id"
    t.string "post_code"
    t.boolean "principal"
    t.string "room", comment: "房间号"
    t.string "source"
    t.uuid "station_id"
    t.string "tel"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
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
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "ship/area_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_ship_area_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_ship_area_hierarchies_on_descendant_id"
  end

  create_table "ship_areas", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "full"
    t.string "locale"
    t.string "name"
    t.string "names", array: true
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.boolean "popular"
    t.boolean "published"
    t.string "timezone"
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_ship_areas_on_parent_id"
  end

  create_table "ship_box_holds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "box_host_id"
    t.uuid "box_specification_id"
    t.integer "boxes_count"
    t.datetime "created_at", null: false
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "organ_id"
    t.integer "owned_amount"
    t.integer "rented_amount"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["box_specification_id"], name: "index_ship_box_holds_on_box_specification_id"
    t.index ["member_id"], name: "index_ship_box_holds_on_member_id"
    t.index ["member_organ_id"], name: "index_ship_box_holds_on_member_organ_id"
    t.index ["organ_id"], name: "index_ship_box_holds_on_organ_id"
    t.index ["user_id"], name: "index_ship_box_holds_on_user_id"
  end

  create_table "ship_box_hosts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "advance_price"
    t.uuid "box_specification_id"
    t.integer "boxes_count"
    t.jsonb "card_price"
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.string "good_type"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.string "name"
    t.uuid "organ_id"
    t.decimal "price"
    t.decimal "quantity"
    t.integer "rent_charges_count"
    t.string "rent_unit"
    t.string "sku"
    t.decimal "step", comment: "Item Number Step"
    t.integer "tradable_count", comment: "可交易数量，可租亦可卖"
    t.virtual "traded_count", type: :integer, as: "(boxes_count - tradable_count)", stored: true
    t.decimal "unified_quantity"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.jsonb "wallet_price"
    t.index ["box_specification_id"], name: "index_ship_box_hosts_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_hosts_on_organ_id"
  end

  create_table "ship_box_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "box_id"
    t.uuid "boxed_id"
    t.datetime "boxed_in_at"
    t.datetime "boxed_out_at"
    t.string "boxed_type"
    t.string "confirm_mode"
    t.datetime "created_at", null: false
    t.integer "duration"
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_ship_box_logs_on_box_id"
    t.index ["boxed_type", "boxed_id"], name: "index_ship_box_logs_on_boxed"
  end

  create_table "ship_box_proxy_buys", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "box_host_id"
    t.uuid "box_specification_id"
    t.integer "buyable_count"
    t.datetime "created_at", null: false
    t.uuid "organ_id"
    t.decimal "price"
    t.datetime "updated_at", null: false
    t.index ["box_host_id"], name: "index_ship_box_proxy_buys_on_box_host_id"
    t.index ["box_specification_id"], name: "index_ship_box_proxy_buys_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_proxy_buys_on_organ_id"
  end

  create_table "ship_box_proxy_sells", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "box_specification_id"
    t.datetime "created_at", null: false
    t.uuid "organ_id"
    t.decimal "price"
    t.integer "sellable_count"
    t.datetime "updated_at", null: false
    t.index ["box_specification_id"], name: "index_ship_box_proxy_sells_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_proxy_sells_on_organ_id"
  end

  create_table "ship_box_sells", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "amount"
    t.uuid "box_specification_id"
    t.datetime "created_at", null: false
    t.integer "done_amount"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "organ_id"
    t.decimal "price"
    t.integer "rest_amount"
    t.string "state"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["box_specification_id"], name: "index_ship_box_sells_on_box_specification_id"
    t.index ["member_id"], name: "index_ship_box_sells_on_member_id"
    t.index ["member_organ_id"], name: "index_ship_box_sells_on_member_organ_id"
    t.index ["organ_id"], name: "index_ship_box_sells_on_organ_id"
    t.index ["user_id"], name: "index_ship_box_sells_on_user_id"
  end

  create_table "ship_box_specifications", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "boxes_count"
    t.string "code"
    t.datetime "created_at", null: false
    t.integer "height"
    t.integer "length"
    t.string "name"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.integer "width"
  end

  create_table "ship_boxes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "box_logs_count"
    t.uuid "box_specification_id"
    t.string "code"
    t.datetime "created_at", null: false
    t.uuid "organ_id"
    t.integer "shipment_items_count"
    t.string "state"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["box_specification_id"], name: "index_ship_boxes_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_boxes_on_organ_id"
  end

  create_table "ship_car_drivers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "car_id"
    t.datetime "created_at", null: false
    t.uuid "driver_id"
    t.string "event_type"
    t.jsonb "repeat_days"
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_ship_car_drivers_on_car_id"
    t.index ["driver_id"], name: "index_ship_car_drivers_on_driver_id"
  end

  create_table "ship_cars", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "brand", comment: "车品牌"
    t.string "carriage"
    t.datetime "created_at", null: false
    t.jsonb "detail"
    t.string "kind"
    t.string "location"
    t.string "number", comment: "车牌号"
    t.uuid "organ_id"
    t.string "tel", comment: "随车电话"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["organ_id"], name: "index_ship_cars_on_organ_id"
    t.index ["user_id"], name: "index_ship_cars_on_user_id"
  end

  create_table "ship_drivers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "detail"
    t.uuid "member_id"
    t.string "name"
    t.string "number"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["member_id"], name: "index_ship_drivers_on_member_id"
    t.index ["organ_id"], name: "index_ship_drivers_on_organ_id"
    t.index ["user_id"], name: "index_ship_drivers_on_user_id"
  end

  create_table "ship_favorites", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "driver_id"
    t.string "remark"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["driver_id"], name: "index_ship_favorites_on_driver_id"
    t.index ["user_id"], name: "index_ship_favorites_on_user_id"
  end

  create_table "ship_line_similars", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "line_id"
    t.integer "position"
    t.decimal "score"
    t.uuid "similar_id"
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_ship_line_similars_on_line_id"
    t.index ["similar_id"], name: "index_ship_line_similars_on_similar_id"
  end

  create_table "ship_line_stations", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "expected_minutes", comment: "预计到下站分钟数"
    t.uuid "line_id"
    t.uuid "organ_id"
    t.integer "position"
    t.uuid "station_id"
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_ship_line_stations_on_line_id"
    t.index ["organ_id"], name: "index_ship_line_stations_on_organ_id"
    t.index ["station_id"], name: "index_ship_line_stations_on_station_id"
  end

  create_table "ship_lines", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "finish_name"
    t.integer "line_stations_count"
    t.string "name"
    t.string "start_name"
    t.datetime "updated_at", null: false
  end

  create_table "ship_locations", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.jsonb "area_ancestors"
    t.uuid "area_id"
    t.string "cityname"
    t.point "coordinate"
    t.datetime "created_at", null: false
    t.decimal "lat"
    t.decimal "lng"
    t.string "name"
    t.string "poiaddress"
    t.string "poiname"
    t.integer "position"
    t.uuid "station_id"
    t.datetime "updated_at", null: false
    t.uuid "way_id"
    t.index ["area_id"], name: "index_ship_locations_on_area_id"
    t.index ["station_id"], name: "index_ship_locations_on_station_id"
    t.index ["way_id"], name: "index_ship_locations_on_way_id"
  end

  create_table "ship_packageds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "good_item_id"
    t.string "good_item_type"
    t.uuid "package_id"
    t.uuid "trade_item_id"
    t.string "trade_item_status"
    t.datetime "updated_at", null: false
    t.index ["good_item_type", "good_item_id"], name: "index_ship_packageds_on_good_item"
    t.index ["package_id"], name: "index_ship_packageds_on_package_id"
    t.index ["trade_item_id"], name: "index_ship_packageds_on_trade_item_id"
  end

  create_table "ship_packages", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "address_id"
    t.uuid "box_id"
    t.datetime "boxed_in_at"
    t.datetime "boxed_out_at"
    t.string "confirm_mode"
    t.datetime "created_at", null: false
    t.uuid "current_shipment_id"
    t.date "expected_on"
    t.uuid "from_address_id"
    t.uuid "from_station_id"
    t.uuid "organ_id"
    t.integer "packageds_count"
    t.string "pick_mode"
    t.uuid "produce_plan_id"
    t.integer "shipment_items_count"
    t.string "state"
    t.uuid "station_id"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
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
    t.uuid "box_id"
    t.string "confirm_mode"
    t.datetime "created_at", null: false
    t.datetime "loaded_at"
    t.uuid "loaded_station_id"
    t.uuid "package_id"
    t.uuid "shipment_id"
    t.string "state"
    t.uuid "station_id"
    t.string "status"
    t.datetime "unloaded_at"
    t.uuid "unloaded_station_id"
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_ship_shipment_items_on_box_id"
    t.index ["loaded_station_id"], name: "index_ship_shipment_items_on_loaded_station_id"
    t.index ["package_id"], name: "index_ship_shipment_items_on_package_id"
    t.index ["shipment_id"], name: "index_ship_shipment_items_on_shipment_id"
    t.index ["station_id"], name: "index_ship_shipment_items_on_station_id"
    t.index ["unloaded_station_id"], name: "index_ship_shipment_items_on_unloaded_station_id"
  end

  create_table "ship_shipment_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "arrived_at"
    t.datetime "created_at", null: false
    t.datetime "expected_leave_at"
    t.datetime "left_at"
    t.datetime "prepared_at"
    t.uuid "shipment_id"
    t.uuid "station_id"
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_ship_shipment_logs_on_shipment_id"
    t.index ["station_id"], name: "index_ship_shipment_logs_on_station_id"
  end

  create_table "ship_shipments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "arrived_at"
    t.uuid "car_id"
    t.datetime "created_at", null: false
    t.uuid "current_line_station_id"
    t.uuid "driver_id"
    t.datetime "expected_arrive_at"
    t.datetime "expected_leave_at"
    t.integer "expected_minutes", comment: "预计路途分钟数"
    t.datetime "left_at"
    t.uuid "line_id"
    t.date "load_on"
    t.uuid "organ_id"
    t.integer "shipment_items_count"
    t.uuid "shipping_id"
    t.string "shipping_type"
    t.string "state"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_ship_shipments_on_car_id"
    t.index ["current_line_station_id"], name: "index_ship_shipments_on_current_line_station_id"
    t.index ["driver_id"], name: "index_ship_shipments_on_driver_id"
    t.index ["line_id"], name: "index_ship_shipments_on_line_id"
    t.index ["organ_id"], name: "index_ship_shipments_on_organ_id"
    t.index ["shipping_type", "shipping_id"], name: "index_ship_shipments_on_shipping"
  end

  create_table "ship_ways", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "finish_name"
    t.uuid "line_id"
    t.integer "locations_count"
    t.string "name"
    t.uuid "organ_id"
    t.string "start_name"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["line_id"], name: "index_ship_ways_on_line_id"
    t.index ["organ_id"], name: "index_ship_ways_on_organ_id"
    t.index ["user_id"], name: "index_ship_ways_on_user_id"
  end

  create_table "space_buildings", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "station_id"
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_space_buildings_on_station_id"
  end

  create_table "space_desks", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.integer "height"
    t.integer "length"
    t.string "name"
    t.uuid "organ_id"
    t.uuid "room_id"
    t.datetime "updated_at", null: false
    t.integer "width"
    t.index ["organ_id"], name: "index_space_desks_on_organ_id"
    t.index ["room_id"], name: "index_space_desks_on_room_id"
  end

  create_table "space_grids", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.integer "floor"
    t.integer "height"
    t.integer "length"
    t.string "name"
    t.uuid "room_id"
    t.datetime "updated_at", null: false
    t.integer "width"
    t.index ["room_id"], name: "index_space_grids_on_room_id"
  end

  create_table "space_rooms", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "building_id"
    t.string "code"
    t.datetime "created_at", null: false
    t.integer "floor"
    t.integer "grids_count"
    t.string "name"
    t.uuid "organ_id"
    t.uuid "station_id"
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_space_rooms_on_building_id"
    t.index ["organ_id"], name: "index_space_rooms_on_organ_id"
    t.index ["station_id"], name: "index_space_rooms_on_station_id"
  end

  create_table "space_stations", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.jsonb "area_ancestors"
    t.uuid "area_id"
    t.integer "buildings_count"
    t.string "cityname"
    t.string "code"
    t.point "coordinate"
    t.datetime "created_at", null: false
    t.string "detail"
    t.decimal "lat"
    t.decimal "lng"
    t.string "name"
    t.uuid "organ_id"
    t.string "poiaddress"
    t.string "poiname"
    t.integer "rooms_count"
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_space_stations_on_area_id"
    t.index ["organ_id"], name: "index_space_stations_on_organ_id"
  end

  create_table "statis_configs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.date "begin_on"
    t.integer "counter_days_count"
    t.integer "counter_months_count"
    t.integer "counter_years_count"
    t.datetime "created_at", null: false
    t.date "end_on"
    t.jsonb "keys"
    t.string "note"
    t.jsonb "scopes"
    t.string "statistical_type"
    t.jsonb "sums"
    t.date "today"
    t.integer "today_begin_id"
    t.datetime "updated_at", null: false
  end

  create_table "statis_counter_days", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "config_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.date "date"
    t.integer "day"
    t.jsonb "filter"
    t.integer "month"
    t.datetime "updated_at", null: false
    t.integer "year"
    t.string "year_month"
    t.index ["config_id"], name: "index_statis_counter_days_on_config_id"
    t.index ["year_month"], name: "index_statis_counter_days_on_year_month"
  end

  create_table "statis_counter_months", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "config_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.jsonb "filter"
    t.integer "month"
    t.datetime "updated_at", null: false
    t.integer "year"
    t.string "year_month"
    t.index ["config_id"], name: "index_statis_counter_months_on_config_id"
    t.index ["year_month"], name: "index_statis_counter_months_on_year_month"
  end

  create_table "statis_counter_years", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.date "begin_on"
    t.uuid "config_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.jsonb "filter"
    t.datetime "updated_at", null: false
    t.integer "year"
    t.index ["config_id"], name: "index_statis_counter_years_on_config_id"
  end

  create_table "statis_statistic_days", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.integer "day"
    t.integer "month"
    t.uuid "statistic_id"
    t.datetime "updated_at", null: false
    t.decimal "value"
    t.integer "year"
    t.string "year_month"
    t.index ["statistic_id"], name: "index_statis_statistic_days_on_statistic_id"
    t.index ["year_month"], name: "index_statis_statistic_days_on_year_month"
  end

  create_table "statis_statistic_months", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "month"
    t.uuid "statistic_id"
    t.datetime "updated_at", null: false
    t.decimal "value"
    t.integer "year"
    t.string "year_month"
    t.index ["statistic_id"], name: "index_statis_statistic_months_on_statistic_id"
    t.index ["year_month"], name: "index_statis_statistic_months_on_year_month"
  end

  create_table "statis_statistic_years", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "statistic_id"
    t.datetime "updated_at", null: false
    t.decimal "value"
    t.integer "year"
    t.index ["statistic_id"], name: "index_statis_statistic_years_on_statistic_id"
  end

  create_table "statis_statistics", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.boolean "cached"
    t.string "column"
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.integer "statistic_days_count"
    t.integer "statistic_months_count"
    t.integer "statistic_years_count"
    t.string "statistical_type"
    t.datetime "updated_at", null: false
    t.string "value"
  end

  create_table "stats", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.integer "oauth_users_count"
    t.integer "requirements_count"
    t.integer "subscribed_requests_count"
    t.datetime "updated_at", null: false
    t.integer "users_count"
  end

  create_table "sync_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "appid"
    t.string "base_url"
    t.datetime "created_at", null: false
    t.string "name"
    t.uuid "organ_id"
    t.string "refresh_token"
    t.datetime "refresh_token_expires_at"
    t.string "secret"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_sync_apps_on_appid"
    t.index ["organ_id"], name: "index_sync_apps_on_organ_id"
  end

  create_table "sync_audits", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "apply_at"
    t.jsonb "audited_changes"
    t.datetime "created_at", null: false
    t.uuid "destined_id"
    t.string "note"
    t.string "operation"
    t.uuid "operator_id"
    t.string "operator_type"
    t.string "state"
    t.uuid "synchro_id"
    t.jsonb "synchro_params"
    t.string "synchro_type"
    t.datetime "updated_at", null: false
    t.index ["destined_id"], name: "index_sync_audits_on_destined_id"
    t.index ["operator_type", "operator_id"], name: "index_sync_audits_on_operator"
    t.index ["synchro_type", "synchro_id"], name: "index_sync_audits_on_synchro"
  end

  create_table "sync_form_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "sync/form_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_sync_form_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_sync_form_hierarchies_on_descendant_id"
  end

  create_table "sync_forms", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "column_name"
    t.datetime "created_at", null: false
    t.boolean "display"
    t.string "external_column_name"
    t.string "external_record_name"
    t.uuid "meta_column_id"
    t.boolean "modeling"
    t.string "name"
    t.uuid "organ_id"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.boolean "primary"
    t.uuid "record_id"
    t.string "record_name"
    t.datetime "updated_at", null: false
    t.index ["meta_column_id"], name: "index_sync_forms_on_meta_column_id"
    t.index ["organ_id"], name: "index_sync_forms_on_organ_id"
    t.index ["parent_id"], name: "index_sync_forms_on_parent_id"
    t.index ["record_id"], name: "index_sync_forms_on_record_id"
  end

  create_table "sync_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "identifier"
    t.integer "logs_count"
    t.uuid "organ_id"
    t.uuid "record_id"
    t.string "source"
    t.datetime "updated_at", null: false
    t.jsonb "values"
    t.index ["identifier"], name: "index_sync_items_on_identifier"
    t.index ["organ_id"], name: "index_sync_items_on_organ_id"
    t.index ["record_id"], name: "index_sync_items_on_record_id"
  end

  create_table "sync_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "exception"
    t.jsonb "exception_backtrace"
    t.uuid "item_id"
    t.uuid "related_id"
    t.string "related_type"
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_sync_logs_on_item_id"
    t.index ["related_type", "related_id"], name: "index_sync_logs_on_related"
  end

  create_table "sync_records", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "app_id"
    t.datetime "created_at", null: false
    t.string "key"
    t.string "name"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_sync_records_on_app_id"
    t.index ["organ_id"], name: "index_sync_records_on_organ_id"
  end

  create_table "trade_addition_charges", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "addition_id"
    t.decimal "base_price"
    t.boolean "contain_max"
    t.boolean "contain_min"
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.decimal "filter_max"
    t.decimal "filter_min"
    t.decimal "max"
    t.decimal "min"
    t.decimal "parameter"
    t.datetime "updated_at", null: false
    t.jsonb "wallet_base_price"
    t.jsonb "wallet_price"
    t.index ["addition_id"], name: "index_trade_addition_charges_on_addition_id"
  end

  create_table "trade_additions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.uuid "deal_id"
    t.string "deal_type"
    t.string "description"
    t.boolean "editable", comment: "是否可更改价格"
    t.jsonb "extra"
    t.string "metering"
    t.string "name"
    t.uuid "organ_id"
    t.string "short_name"
    t.string "unit_code"
    t.datetime "updated_at", null: false
    t.boolean "verified"
    t.index ["deal_type", "deal_id"], name: "index_trade_additions_on_deal"
    t.index ["organ_id"], name: "index_trade_additions_on_organ_id"
  end

  create_table "trade_advances", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "advance_price"
    t.decimal "amount"
    t.string "apple_product_id", comment: "For 苹果应用内支付"
    t.jsonb "card_price"
    t.uuid "card_template_id"
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.string "good_type"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.boolean "lawful", comment: "是否法币"
    t.string "name"
    t.boolean "open"
    t.uuid "organ_id"
    t.decimal "price"
    t.decimal "quantity"
    t.string "sku"
    t.decimal "step", comment: "Item Number Step"
    t.decimal "unified_quantity"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.jsonb "wallet_price"
    t.uuid "wallet_template_id"
    t.index ["card_template_id"], name: "index_trade_advances_on_card_template_id"
    t.index ["organ_id"], name: "index_trade_advances_on_organ_id"
    t.index ["wallet_template_id"], name: "index_trade_advances_on_wallet_template_id"
  end

  create_table "trade_card_purchases", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "card_id"
    t.datetime "created_at", null: false
    t.integer "days"
    t.uuid "item_id"
    t.string "kind"
    t.datetime "last_expire_at"
    t.integer "months"
    t.string "note"
    t.decimal "price"
    t.uuid "purchase_id"
    t.string "state"
    t.datetime "updated_at", null: false
    t.integer "years"
    t.index ["card_id"], name: "index_trade_card_purchases_on_card_id"
    t.index ["item_id"], name: "index_trade_card_purchases_on_item_id"
    t.index ["purchase_id"], name: "index_trade_card_purchases_on_purchase_id"
  end

  create_table "trade_card_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "cards_count"
    t.string "code"
    t.datetime "created_at", null: false
    t.string "description"
    t.boolean "enabled"
    t.integer "grade", comment: "会员级别"
    t.string "name"
    t.uuid "organ_id"
    t.uuid "parent_id"
    t.uuid "promote_id"
    t.string "text_color"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_trade_card_templates_on_organ_id"
    t.index ["parent_id"], name: "index_trade_card_templates_on_parent_id"
    t.index ["promote_id"], name: "index_trade_card_templates_on_promote_id"
  end

  create_table "trade_cards", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "agency_id"
    t.uuid "agent_id"
    t.uuid "card_template_id"
    t.string "card_uuid"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.datetime "created_at", null: false
    t.datetime "effect_at"
    t.datetime "expire_at"
    t.integer "lock_version"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "organ_id"
    t.boolean "temporary", comment: "在购物车勾选临时生效"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
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
    t.decimal "amount", comment: "默认等于 computed_amount，如果客服人员修改过价格后，则 amount 会发生变化"
    t.decimal "based_amount", comment: "基于此价格计算，默认为 item 的 amount，与sequence有关"
    t.uuid "cart_id"
    t.decimal "computed_amount", comment: "计算出的价格"
    t.datetime "created_at", null: false
    t.boolean "edited", comment: "是否被客服改过价"
    t.string "note", comment: "备注"
    t.uuid "order_id"
    t.uuid "organ_id"
    t.decimal "original_amount", comment: "初始价格"
    t.uuid "promote_charge_id"
    t.uuid "promote_id"
    t.string "promote_name"
    t.integer "sequence"
    t.string "status"
    t.jsonb "unit_prices"
    t.datetime "updated_at", null: false
    t.decimal "value"
    t.index ["cart_id"], name: "index_trade_cart_promotes_on_cart_id"
    t.index ["order_id"], name: "index_trade_cart_promotes_on_order_id"
    t.index ["organ_id"], name: "index_trade_cart_promotes_on_organ_id"
    t.index ["promote_charge_id"], name: "index_trade_cart_promotes_on_promote_charge_id"
    t.index ["promote_id"], name: "index_trade_cart_promotes_on_promote_id"
  end

  create_table "trade_carts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "address_id"
    t.decimal "advance_amount"
    t.uuid "agent_id"
    t.string "aim"
    t.decimal "amount"
    t.boolean "auto", comment: "自动下单"
    t.decimal "bulk_price"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.datetime "created_at", null: false
    t.integer "deposit_ratio", comment: "最小预付比例"
    t.uuid "desk_id"
    t.decimal "discount_price", comment: "汇总：优惠"
    t.jsonb "extra"
    t.boolean "fresh"
    t.string "good_type"
    t.decimal "item_amount"
    t.integer "items_count"
    t.integer "lock_version"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "organ_id"
    t.decimal "original_amount", comment: "原价，应用优惠之前的价格"
    t.decimal "overall_additional_amount"
    t.decimal "overall_reduced_amount"
    t.uuid "payment_strategy_id"
    t.boolean "purchasable"
    t.decimal "retail_price", comment: "汇总：原价"
    t.uuid "station_id"
    t.decimal "total_quantity"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
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
    t.uuid "agent_id"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.datetime "created_at", null: false
    t.datetime "fetch_finish_at"
    t.boolean "fetch_oneself", comment: "自取"
    t.datetime "fetch_start_at"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "order_id"
    t.uuid "organ_id"
    t.date "produce_on", comment: "对接生产管理"
    t.uuid "scene_id"
    t.string "state"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
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
    t.datetime "created_at", null: false
    t.string "from"
    t.decimal "rate"
    t.string "to"
    t.datetime "updated_at", null: false
  end

  create_table "trade_holds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.decimal "estimate_amount"
    t.jsonb "estimate_wallet_amount"
    t.jsonb "extra"
    t.decimal "invest_amount", comment: "投资分成"
    t.uuid "item_id"
    t.string "job_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.integer "rent_duration"
    t.integer "rent_estimate_duration"
    t.datetime "rent_estimate_finish_at", comment: "预估结束时间"
    t.datetime "rent_finish_at", comment: "实际结束时间"
    t.datetime "rent_present_finish_at", comment: "周期性计费时间"
    t.datetime "rent_start_at"
    t.uuid "rentable_id"
    t.string "rentable_type"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.jsonb "wallet_amount"
    t.index ["item_id"], name: "index_trade_holds_on_item_id"
    t.index ["member_id"], name: "index_trade_holds_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_holds_on_member_organ_id"
    t.index ["rentable_type", "rentable_id"], name: "index_trade_holds_on_rentable"
    t.index ["user_id"], name: "index_trade_holds_on_user_id"
  end

  create_table "trade_item_promotes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.uuid "item_id"
    t.decimal "original_amount"
    t.uuid "promote_charge_id"
    t.uuid "promote_good_id"
    t.uuid "promote_id"
    t.string "promote_name"
    t.string "status"
    t.decimal "unit_price"
    t.datetime "updated_at", null: false
    t.decimal "value"
    t.index ["item_id"], name: "index_trade_item_promotes_on_item_id"
    t.index ["promote_charge_id"], name: "index_trade_item_promotes_on_promote_charge_id"
    t.index ["promote_good_id"], name: "index_trade_item_promotes_on_promote_good_id"
    t.index ["promote_id"], name: "index_trade_item_promotes_on_promote_id"
  end

  create_table "trade_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "additional_amount", comment: "附加服务价格汇总"
    t.uuid "address_id"
    t.decimal "advance_amount", comment: "预付款"
    t.uuid "agent_id"
    t.string "aim"
    t.decimal "amount", comment: "合计份数之后的价格，商品原价"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.datetime "created_at", null: false
    t.uuid "current_cart_id"
    t.string "delivery_status"
    t.uuid "desk_id"
    t.string "dispatch"
    t.decimal "done_number", comment: "已达成交易数量"
    t.datetime "expire_at"
    t.jsonb "extra"
    t.uuid "from_address_id"
    t.uuid "from_station_id"
    t.uuid "good_id"
    t.string "good_name"
    t.string "good_type"
    t.integer "holds_count"
    t.string "job_id"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.string "note"
    t.decimal "number", comment: "数量"
    t.uuid "operator_id"
    t.uuid "order_id"
    t.uuid "organ_id"
    t.date "produce_on", comment: "对接生产管理"
    t.uuid "provide_id"
    t.integer "purchase_id"
    t.integer "purchase_items_count"
    t.string "purchase_status"
    t.decimal "reduced_amount", comment: "已优惠的价格"
    t.virtual "rest_number", type: :decimal, as: "(number - done_number)", stored: true
    t.uuid "scene_id"
    t.decimal "single_price", comment: "一份产品的价格"
    t.uuid "source_id"
    t.uuid "station_id"
    t.string "status"
    t.uuid "unit_id"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.string "uuid"
    t.string "vip_code"
    t.integer "volume", comment: "体积"
    t.jsonb "wallet_amount"
    t.integer "weight", comment: "重量"
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
    t.uuid "address_id"
    t.decimal "adjust_amount"
    t.decimal "advance_amount"
    t.uuid "agent_id"
    t.string "aim"
    t.decimal "amount"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.datetime "created_at", null: false
    t.string "currency"
    t.uuid "current_cart_id"
    t.integer "deposit_ratio", comment: "最小预付比例"
    t.uuid "desk_id"
    t.datetime "expire_at"
    t.jsonb "extra"
    t.uuid "from_address_id"
    t.uuid "from_member_id"
    t.uuid "from_member_organ_id"
    t.uuid "from_station_id"
    t.uuid "from_user_id"
    t.string "generate_mode"
    t.decimal "item_amount"
    t.integer "items_count"
    t.integer "lock_version"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.string "note"
    t.uuid "operator_id"
    t.uuid "organ_id"
    t.decimal "original_amount", comment: "原价，应用优惠之前的价格"
    t.decimal "overall_additional_amount"
    t.decimal "overall_reduced_amount"
    t.datetime "paid_at"
    t.boolean "pay_auto"
    t.datetime "pay_deadline_at"
    t.decimal "payable_amount"
    t.integer "payment_orders_count"
    t.string "payment_status"
    t.uuid "payment_strategy_id"
    t.uuid "produce_plan_id"
    t.uuid "provide_id"
    t.decimal "received_amount"
    t.decimal "refunded_amount"
    t.integer "serial_number"
    t.string "state"
    t.uuid "station_id"
    t.decimal "unreceived_amount"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.string "uuid"
    t.decimal "verifying_amount", comment: "待核销金额"
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
    t.string "account_name"
    t.string "account_num"
    t.string "bank"
    t.datetime "created_at", null: false
    t.uuid "creator_id"
    t.jsonb "extra"
    t.boolean "myself"
    t.string "type"
    t.datetime "updated_at", null: false
    t.boolean "verified"
    t.index ["creator_id"], name: "index_trade_payment_methods_on_creator_id"
  end

  create_table "trade_payment_orders", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "kind"
    t.decimal "order_amount"
    t.uuid "order_id"
    t.decimal "payment_amount"
    t.uuid "payment_id"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_trade_payment_orders_on_order_id"
    t.index ["payment_id"], name: "index_trade_payment_orders_on_payment_id"
  end

  create_table "trade_payment_references", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "organ_id"
    t.uuid "payment_method_id"
    t.string "state"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["member_id"], name: "index_trade_payment_references_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_payment_references_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_payment_references_on_organ_id"
    t.index ["payment_method_id"], name: "index_trade_payment_references_on_payment_method_id"
    t.index ["user_id"], name: "index_trade_payment_references_on_user_id"
  end

  create_table "trade_payment_strategies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "from_pay"
    t.string "name"
    t.uuid "organ_id"
    t.integer "period", comment: "可延期时间，单位天"
    t.string "strategy"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_trade_payment_strategies_on_organ_id"
  end

  create_table "trade_payments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "adjust_amount"
    t.string "appid"
    t.string "buyer_bank"
    t.string "buyer_identifier"
    t.string "buyer_name"
    t.decimal "checked_amount", comment: "实际支付汇总"
    t.string "comment"
    t.datetime "created_at", null: false
    t.string "currency"
    t.jsonb "extra"
    t.jsonb "extra_params"
    t.decimal "fee_amount"
    t.decimal "income_amount", comment: "实际到账"
    t.integer "lock_version"
    t.datetime "notified_at"
    t.string "notify_type"
    t.uuid "operator_id"
    t.string "operator_type"
    t.decimal "orders_amount", comment: "订单金额汇总"
    t.uuid "organ_id"
    t.string "pay_state"
    t.string "pay_status", comment: "记录来自服务商的状态"
    t.integer "payment_id", comment: "for paypal"
    t.uuid "payment_method_id"
    t.integer "payment_orders_count"
    t.string "payment_uuid"
    t.decimal "refunded_amount"
    t.integer "refunds_count"
    t.string "seller_identifier"
    t.string "state"
    t.decimal "total_amount"
    t.string "type"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.boolean "verified", comment: "是否已确认收款"
    t.uuid "wallet_id"
    t.index ["operator_type", "operator_id"], name: "index_trade_payments_on_operator"
    t.index ["organ_id"], name: "index_trade_payments_on_organ_id"
    t.index ["payment_method_id"], name: "index_trade_payments_on_payment_method_id"
    t.index ["user_id"], name: "index_trade_payments_on_user_id"
    t.index ["wallet_id"], name: "index_trade_payments_on_wallet_id"
  end

  create_table "trade_payouts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "account_bank"
    t.string "account_name"
    t.string "account_num"
    t.decimal "actual_amount"
    t.boolean "advance"
    t.datetime "created_at", null: false
    t.uuid "operator_id"
    t.datetime "paid_at"
    t.uuid "payable_id"
    t.string "payable_type"
    t.string "payout_uuid"
    t.decimal "requested_amount"
    t.string "state"
    t.string "type"
    t.datetime "updated_at", null: false
    t.uuid "wallet_id"
    t.index ["operator_id"], name: "index_trade_payouts_on_operator_id"
    t.index ["payable_type", "payable_id"], name: "index_trade_payouts_on_payable"
    t.index ["wallet_id"], name: "index_trade_payouts_on_wallet_id"
  end

  create_table "trade_privileges", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "amount", comment: "额度"
    t.uuid "card_template_id"
    t.string "code"
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "position"
    t.decimal "price", comment: "价格"
    t.uuid "promote_id"
    t.datetime "updated_at", null: false
    t.index ["card_template_id"], name: "index_trade_privileges_on_card_template_id"
    t.index ["promote_id"], name: "index_trade_privileges_on_promote_id"
  end

  create_table "trade_promote_charges", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "base_price"
    t.boolean "contain_max"
    t.boolean "contain_min"
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.decimal "filter_max"
    t.decimal "filter_min"
    t.decimal "max"
    t.decimal "min"
    t.decimal "parameter"
    t.uuid "promote_id"
    t.string "type"
    t.datetime "updated_at", null: false
    t.jsonb "wallet_base_price"
    t.jsonb "wallet_price"
    t.index ["promote_id"], name: "index_trade_promote_charges_on_promote_id"
  end

  create_table "trade_promote_extras", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "column_name"
    t.datetime "created_at", null: false
    t.string "extra_name"
    t.uuid "promote_id"
    t.datetime "updated_at", null: false
    t.index ["promote_id"], name: "index_trade_promote_extras_on_promote_id"
  end

  create_table "trade_promote_goods", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "agent_id"
    t.string "aim"
    t.integer "blacklists_count"
    t.uuid "card_id"
    t.uuid "card_template_id"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.datetime "created_at", null: false
    t.datetime "effect_at"
    t.datetime "expire_at"
    t.uuid "good_id"
    t.string "good_type"
    t.string "identity"
    t.integer "item_promotes_count"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.uuid "organ_id"
    t.virtual "over_limit", type: :boolean, as: "(item_promotes_count >= use_limit)", stored: true
    t.uuid "part_id"
    t.uuid "promote_id"
    t.string "status"
    t.uuid "taxon_id"
    t.datetime "updated_at", null: false
    t.integer "use_limit"
    t.uuid "user_id"
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
    t.string "code"
    t.datetime "created_at", null: false
    t.uuid "deal_id"
    t.string "deal_type"
    t.string "description"
    t.boolean "editable", comment: "是否可更改价格"
    t.jsonb "extra"
    t.string "metering"
    t.string "name"
    t.uuid "organ_id"
    t.integer "sequence"
    t.string "short_name"
    t.string "unit_code"
    t.datetime "updated_at", null: false
    t.index ["deal_type", "deal_id"], name: "index_trade_promotes_on_deal"
    t.index ["organ_id"], name: "index_trade_promotes_on_organ_id"
  end

  create_table "trade_purchases", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.uuid "card_template_id"
    t.datetime "created_at", null: false
    t.integer "days"
    t.boolean "default"
    t.jsonb "extra"
    t.string "good_type"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.integer "months"
    t.string "name"
    t.string "note"
    t.decimal "price"
    t.decimal "quantity"
    t.string "sku"
    t.decimal "step", comment: "Item Number Step"
    t.string "title"
    t.decimal "unified_quantity"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.jsonb "wallet_price"
    t.integer "years"
    t.index ["card_template_id"], name: "index_trade_purchases_on_card_template_id"
  end

  create_table "trade_refund_orders", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "order_amount", comment: "对应的订单金额"
    t.uuid "order_id"
    t.decimal "payment_amount"
    t.uuid "payment_id"
    t.uuid "refund_id"
    t.string "state"
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_trade_refund_orders_on_order_id"
    t.index ["payment_id"], name: "index_trade_refund_orders_on_payment_id"
    t.index ["refund_id"], name: "index_trade_refund_orders_on_refund_id"
  end

  create_table "trade_refunds", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "buyer_identifier"
    t.string "comment"
    t.datetime "created_at", null: false
    t.string "currency"
    t.uuid "operator_id"
    t.uuid "payment_id"
    t.string "reason"
    t.string "refund_uuid"
    t.datetime "refunded_at"
    t.jsonb "response"
    t.string "state"
    t.decimal "total_amount"
    t.string "type"
    t.datetime "updated_at", null: false
    t.uuid "wallet_id"
    t.index ["operator_id"], name: "index_trade_refunds_on_operator_id"
    t.index ["payment_id"], name: "index_trade_refunds_on_payment_id"
    t.index ["wallet_id"], name: "index_trade_refunds_on_wallet_id"
  end

  create_table "trade_rent_charges", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "base_price"
    t.boolean "contain_max"
    t.boolean "contain_min"
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.integer "filter_max"
    t.integer "filter_min"
    t.integer "max"
    t.integer "min"
    t.decimal "parameter"
    t.uuid "rentable_id"
    t.string "rentable_type"
    t.datetime "updated_at", null: false
    t.jsonb "wallet_base_price"
    t.jsonb "wallet_price"
    t.index ["rentable_type", "rentable_id"], name: "index_trade_rent_charges_on_rentable"
  end

  create_table "trade_units", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.boolean "default"
    t.string "metering"
    t.string "name"
    t.decimal "rate", comment: "相对于默认单位的计算比率"
    t.datetime "updated_at", null: false
  end

  create_table "trade_wallet_advances", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "advance_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.uuid "item_id"
    t.string "kind"
    t.string "note"
    t.uuid "operator_id"
    t.decimal "price"
    t.string "state"
    t.datetime "updated_at", null: false
    t.uuid "wallet_id"
    t.uuid "wallet_prepayment_id"
    t.index ["advance_id"], name: "index_trade_wallet_advances_on_advance_id"
    t.index ["item_id"], name: "index_trade_wallet_advances_on_item_id"
    t.index ["operator_id"], name: "index_trade_wallet_advances_on_operator_id"
    t.index ["wallet_id"], name: "index_trade_wallet_advances_on_wallet_id"
    t.index ["wallet_prepayment_id"], name: "index_trade_wallet_advances_on_wallet_prepayment_id"
  end

  create_table "trade_wallet_frozens", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.uuid "item_id"
    t.string "note"
    t.uuid "operator_id"
    t.string "state"
    t.datetime "updated_at", null: false
    t.uuid "wallet_id"
    t.index ["item_id"], name: "index_trade_wallet_frozens_on_item_id"
    t.index ["operator_id"], name: "index_trade_wallet_frozens_on_operator_id"
    t.index ["wallet_id"], name: "index_trade_wallet_frozens_on_wallet_id"
  end

  create_table "trade_wallet_goods", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "good_id"
    t.string "good_type"
    t.datetime "updated_at", null: false
    t.string "wallet_code"
    t.uuid "wallet_template_id"
    t.index ["good_type", "good_id"], name: "index_trade_wallet_goods_on_good"
    t.index ["wallet_template_id"], name: "index_trade_wallet_goods_on_wallet_template_id"
  end

  create_table "trade_wallet_logs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.uuid "source_id"
    t.string "source_type"
    t.string "tag_str"
    t.string "title"
    t.datetime "updated_at", null: false
    t.uuid "wallet_id"
    t.index ["source_type", "source_id"], name: "index_trade_wallet_logs_on_source"
    t.index ["wallet_id"], name: "index_trade_wallet_logs_on_wallet_id"
  end

  create_table "trade_wallet_prepayments", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "expire_at"
    t.boolean "lawful"
    t.string "token"
    t.datetime "updated_at", null: false
    t.uuid "wallet_template_id"
    t.index ["wallet_template_id"], name: "index_trade_wallet_prepayments_on_wallet_template_id"
  end

  create_table "trade_wallet_sells", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.uuid "item_id"
    t.string "note"
    t.uuid "operator_id"
    t.uuid "selled_id"
    t.string "selled_type"
    t.string "state"
    t.datetime "updated_at", null: false
    t.uuid "wallet_id"
    t.index ["item_id"], name: "index_trade_wallet_sells_on_item_id"
    t.index ["operator_id"], name: "index_trade_wallet_sells_on_operator_id"
    t.index ["selled_type", "selled_id"], name: "index_trade_wallet_sells_on_selled"
    t.index ["wallet_id"], name: "index_trade_wallet_sells_on_wallet_id"
  end

  create_table "trade_wallet_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid", comment: "推广微信公众号"
    t.string "code"
    t.datetime "created_at", null: false
    t.string "description"
    t.integer "digit", comment: "精确到小数点后几位"
    t.boolean "enabled"
    t.string "name"
    t.uuid "organ_id"
    t.string "platform"
    t.string "rate", comment: "相对于默认货币的比率"
    t.string "unit"
    t.string "unit_name"
    t.datetime "updated_at", null: false
    t.integer "wallets_count"
    t.index ["organ_id"], name: "index_trade_wallet_templates_on_organ_id"
  end

  create_table "trade_wallets", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "account_bank"
    t.string "account_name"
    t.string "account_number"
    t.decimal "advances_amount", comment: "收入：主动充值"
    t.uuid "agent_id"
    t.decimal "amount"
    t.uuid "client_id"
    t.uuid "contact_id"
    t.datetime "created_at", null: false
    t.decimal "expense_amount"
    t.decimal "frozen_amount", comment: "支出：冻结金额"
    t.decimal "income_amount"
    t.integer "lock_version"
    t.uuid "member_id"
    t.uuid "member_organ_id"
    t.string "name"
    t.uuid "organ_id"
    t.decimal "payment_amount", comment: "支出：钱包支付"
    t.decimal "payout_amount", comment: "支出：提现"
    t.decimal "refunded_amount", comment: "收入：退款"
    t.decimal "sells_amount", comment: "收入：交易入账"
    t.string "type"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.uuid "wallet_template_id"
    t.decimal "withdrawable_amount", comment: "可提现的额度"
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
    t.datetime "created_at", null: false
    t.string "key"
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["appid"], name: "index_wechat_app_configs_on_appid"
  end

  create_table "wechat_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "alias_name"
    t.string "appid"
    t.integer "audit_status"
    t.integer "auditid"
    t.jsonb "business_info"
    t.string "confirm_content"
    t.string "confirm_name"
    t.datetime "created_at", null: false
    t.boolean "debug"
    t.boolean "enabled"
    t.string "encoding_aes_key"
    t.boolean "encrypt_mode"
    t.jsonb "extra"
    t.string "func_infos", array: true
    t.boolean "global"
    t.string "head_img"
    t.string "jsapi_ticket"
    t.datetime "jsapi_ticket_expires_at"
    t.string "logo_media_id"
    t.string "nick_name"
    t.string "oauth_domain"
    t.string "open_appid"
    t.uuid "organ_id"
    t.string "platform_appid"
    t.uuid "platform_id"
    t.uuid "platform_template_id"
    t.string "principal_name"
    t.string "qrcode_url"
    t.string "refresh_token"
    t.string "secret"
    t.string "service_corp"
    t.string "service_type"
    t.string "service_url"
    t.string "ticket"
    t.string "token"
    t.string "type"
    t.datetime "updated_at", null: false
    t.string "url_link"
    t.string "user_name"
    t.string "verify_type"
    t.jsonb "version_info"
    t.string "weapp_id", comment: "关联的小程序"
    t.string "webview_domain"
    t.jsonb "webview_domain_registered"
    t.index ["organ_id"], name: "index_wechat_apps_on_organ_id"
    t.index ["platform_id"], name: "index_wechat_apps_on_platform_id"
    t.index ["platform_template_id"], name: "index_wechat_apps_on_platform_template_id"
  end

  create_table "wechat_auths", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "auth_code"
    t.datetime "auth_code_expires_at"
    t.datetime "created_at", null: false
    t.uuid "platform_id"
    t.uuid "request_id"
    t.boolean "testcase"
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_wechat_auths_on_platform_id"
    t.index ["request_id"], name: "index_wechat_auths_on_request_id"
  end

  create_table "wechat_categories", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "extra"
    t.string "kind"
    t.integer "level"
    t.string "name"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.string "scope"
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_wechat_categories_on_parent_id"
  end

  create_table "wechat_category_hierarchies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.uuid "ancestor_id"
    t.datetime "created_at"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "wechat/category_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_wechat_category_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_wechat_category_hierarchies_on_descendant_id"
  end

  create_table "wechat_contacts", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "config_id"
    t.string "corpid"
    t.datetime "created_at", null: false
    t.string "part_id"
    t.string "qr_code"
    t.string "remark"
    t.boolean "skip_verify"
    t.string "state"
    t.string "suite_id"
    t.datetime "updated_at", null: false
    t.string "userid"
  end

  create_table "wechat_corp_external_users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "corpid"
    t.datetime "created_at", null: false
    t.string "external_userid"
    t.string "pending_id"
    t.string "subject_type"
    t.string "uid"
    t.string "unionid"
    t.datetime "updated_at", null: false
    t.index ["corpid"], name: "index_wechat_corp_external_users_on_corpid"
    t.index ["external_userid"], name: "index_wechat_corp_external_users_on_external_userid"
    t.index ["uid"], name: "index_wechat_corp_external_users_on_uid"
    t.index ["unionid"], name: "index_wechat_corp_external_users_on_unionid"
  end

  create_table "wechat_corp_users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "avatar_url"
    t.string "corpid"
    t.datetime "created_at", null: false
    t.jsonb "department"
    t.string "device_id"
    t.integer "follows_count"
    t.string "gender"
    t.string "identity"
    t.string "name"
    t.string "open_id"
    t.string "open_userid"
    t.uuid "organ_id"
    t.string "qr_code"
    t.string "suite_id"
    t.datetime "ticket_expires_at"
    t.datetime "updated_at", null: false
    t.string "user_ticket"
    t.string "userid"
    t.index ["organ_id"], name: "index_wechat_corp_users_on_organ_id"
    t.index ["suite_id"], name: "index_wechat_corp_users_on_suite_id"
    t.index ["userid"], name: "index_wechat_corp_users_on_userid"
  end

  create_table "wechat_corps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.jsonb "agent"
    t.string "agent_ticket"
    t.datetime "agent_ticket_expires_at"
    t.string "agentid"
    t.jsonb "auth_corp_info"
    t.jsonb "auth_user_info"
    t.string "confirm_content"
    t.string "confirm_name"
    t.string "corp_type"
    t.string "corpid"
    t.datetime "created_at", null: false
    t.boolean "debug"
    t.string "domain"
    t.string "encoding_aes_key"
    t.string "full_name"
    t.string "industry"
    t.boolean "inviting", comment: "可邀请加入"
    t.string "jsapi_ticket"
    t.datetime "jsapi_ticket_expires_at"
    t.string "location"
    t.string "name"
    t.string "open_corpid"
    t.uuid "organ_id"
    t.string "permanent_code"
    t.jsonb "register_code_info"
    t.string "secret"
    t.string "square_logo_url"
    t.string "sub_industry"
    t.string "subject_type"
    t.string "suite_id"
    t.string "token"
    t.string "type"
    t.datetime "updated_at", null: false
    t.string "url_link"
    t.integer "user_max"
    t.string "user_name"
    t.datetime "verified_end_at"
    t.string "wxqrcode"
    t.index ["corpid"], name: "index_wechat_corps_on_corpid"
    t.index ["open_corpid"], name: "index_wechat_corps_on_open_corpid"
    t.index ["organ_id"], name: "index_wechat_corps_on_organ_id"
  end

  create_table "wechat_extractions", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "extractor_id"
    t.string "matched"
    t.string "name"
    t.uuid "request_id"
    t.integer "serial_number"
    t.datetime "updated_at", null: false
    t.index ["extractor_id"], name: "index_wechat_extractions_on_extractor_id"
    t.index ["request_id"], name: "index_wechat_extractions_on_request_id"
  end

  create_table "wechat_extractors", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.time "finish_at"
    t.string "invalid_response"
    t.boolean "more"
    t.string "name"
    t.string "prefix"
    t.uuid "response_id"
    t.boolean "serial"
    t.integer "serial_start"
    t.time "start_at"
    t.string "suffix"
    t.datetime "updated_at", null: false
    t.string "valid_response"
    t.index ["response_id"], name: "index_wechat_extractors_on_response_id"
  end

  create_table "wechat_hooks", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "hooked_id"
    t.string "hooked_type"
    t.uuid "response_id"
    t.datetime "updated_at", null: false
    t.index ["hooked_type", "hooked_id"], name: "index_wechat_hooks_on_hooked"
    t.index ["response_id"], name: "index_wechat_hooks_on_response_id"
  end

  create_table "wechat_medias", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.string "attachment_name"
    t.datetime "created_at", null: false
    t.string "media_id"
    t.uuid "source_id"
    t.string "source_type"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["source_type", "source_id"], name: "index_wechat_medias_on_source"
    t.index ["user_id"], name: "index_wechat_medias_on_user_id"
  end

  create_table "wechat_menu_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.datetime "created_at", null: false
    t.uuid "menu_id"
    t.uuid "menu_root_app_id"
    t.uuid "menu_root_id"
    t.string "mp_appid"
    t.string "mp_pagepath"
    t.string "name"
    t.integer "position"
    t.uuid "scene_id"
    t.uuid "tag_id"
    t.string "type"
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["appid"], name: "index_wechat_menu_apps_on_appid"
    t.index ["menu_id"], name: "index_wechat_menu_apps_on_menu_id"
    t.index ["menu_root_app_id"], name: "index_wechat_menu_apps_on_menu_root_app_id"
    t.index ["menu_root_id"], name: "index_wechat_menu_apps_on_menu_root_id"
    t.index ["scene_id"], name: "index_wechat_menu_apps_on_scene_id"
    t.index ["tag_id"], name: "index_wechat_menu_apps_on_tag_id"
  end

  create_table "wechat_menu_disables", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.datetime "created_at", null: false
    t.uuid "menu_id"
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_menu_disables_on_appid"
    t.index ["menu_id"], name: "index_wechat_menu_disables_on_menu_id"
  end

  create_table "wechat_menu_root_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.datetime "created_at", null: false
    t.uuid "menu_root_id"
    t.string "name"
    t.integer "position"
    t.datetime "updated_at", null: false
    t.index ["menu_root_id"], name: "index_wechat_menu_root_apps_on_menu_root_id"
  end

  create_table "wechat_menu_roots", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "position"
    t.datetime "updated_at", null: false
  end

  create_table "wechat_menus", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "menu_root_id"
    t.string "mp_appid"
    t.string "mp_pagepath"
    t.string "name"
    t.integer "position"
    t.string "type"
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["menu_root_id"], name: "index_wechat_menus_on_menu_root_id"
  end

  create_table "wechat_messages", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.string "content"
    t.datetime "created_at", null: false
    t.string "encrypt_data"
    t.string "info_type"
    t.jsonb "message_hash"
    t.string "msg_format"
    t.string "msg_id"
    t.string "msg_type"
    t.string "open_id"
    t.uuid "platform_id"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_messages_on_appid"
    t.index ["open_id"], name: "index_wechat_messages_on_open_id"
    t.index ["platform_id"], name: "index_wechat_messages_on_platform_id"
  end

  create_table "wechat_news_reply_items", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.uuid "news_reply_id"
    t.string "raw_pic_url"
    t.string "title"
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["news_reply_id"], name: "index_wechat_news_reply_items_on_news_reply_id"
  end

  create_table "wechat_notices", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.datetime "created_at", null: false
    t.string "link"
    t.string "msg_id"
    t.uuid "msg_request_id"
    t.uuid "notification_id"
    t.string "open_id"
    t.jsonb "result"
    t.string "status"
    t.uuid "template_id"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["msg_request_id"], name: "index_wechat_notices_on_msg_request_id"
    t.index ["notification_id"], name: "index_wechat_notices_on_notification_id"
    t.index ["template_id"], name: "index_wechat_notices_on_template_id"
  end

  create_table "wechat_partners", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "apiclient_cert"
    t.string "apiclient_key"
    t.string "appid", comment: "sp_appid"
    t.datetime "created_at", null: false
    t.jsonb "encrypt_certificate"
    t.string "key"
    t.string "key_v3"
    t.string "mch_id", comment: "支付专用、商户号"
    t.string "name"
    t.datetime "platform_effective_at"
    t.datetime "platform_expire_at"
    t.string "platform_serial_no"
    t.string "serial_no"
    t.datetime "updated_at", null: false
  end

  create_table "wechat_payee_apps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.datetime "created_at", null: false
    t.boolean "enabled"
    t.string "mch_id"
    t.uuid "organ_id"
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_payee_apps_on_appid"
    t.index ["mch_id"], name: "index_wechat_payee_apps_on_mch_id"
    t.index ["organ_id"], name: "index_wechat_payee_apps_on_organ_id"
  end

  create_table "wechat_payee_domains", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "domain"
    t.string "mch_id"
    t.datetime "updated_at", null: false
    t.index ["domain"], name: "index_wechat_payee_domains_on_domain"
    t.index ["mch_id"], name: "index_wechat_payee_domains_on_mch_id"
  end

  create_table "wechat_payees", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "apiclient_cert"
    t.string "apiclient_key"
    t.datetime "created_at", null: false
    t.jsonb "encrypt_certificate"
    t.string "key"
    t.string "key_v3"
    t.string "mch_id", comment: "支付专用、商户号"
    t.string "name"
    t.uuid "organ_id"
    t.uuid "partner_id"
    t.datetime "platform_effective_at"
    t.datetime "platform_expire_at"
    t.string "platform_serial_no"
    t.string "serial_no"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_wechat_payees_on_organ_id"
    t.index ["partner_id"], name: "index_wechat_payees_on_partner_id"
  end

  create_table "wechat_platform_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.integer "audit_status"
    t.datetime "created_at", null: false
    t.uuid "platform_id"
    t.integer "template_id"
    t.datetime "updated_at", null: false
    t.string "user_desc"
    t.string "user_version"
    t.index ["platform_id"], name: "index_wechat_platform_templates_on_platform_id"
  end

  create_table "wechat_platform_tickets", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.datetime "created_at", null: false
    t.string "info_type"
    t.jsonb "message_hash"
    t.string "msg_signature"
    t.string "nonce"
    t.string "signature"
    t.string "ticket_data"
    t.integer "timestamp"
    t.datetime "updated_at", null: false
  end

  create_table "wechat_platforms", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "appid"
    t.datetime "created_at", null: false
    t.string "domain"
    t.string "encoding_aes_key"
    t.string "name"
    t.string "pre_auth_code"
    t.datetime "pre_auth_code_expires_at"
    t.uuid "program_agency_id"
    t.uuid "public_agency_id"
    t.string "secret"
    t.string "token"
    t.datetime "updated_at", null: false
    t.string "verify_ticket"
    t.index ["program_agency_id"], name: "index_wechat_platforms_on_program_agency_id"
    t.index ["public_agency_id"], name: "index_wechat_platforms_on_public_agency_id"
  end

  create_table "wechat_provider_organs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "corpid"
    t.datetime "created_at", null: false
    t.string "open_corpid"
    t.uuid "provider_id"
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_wechat_provider_organs_on_provider_id"
  end

  create_table "wechat_providers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "corp_id"
    t.datetime "created_at", null: false
    t.string "encoding_aes_key"
    t.string "name"
    t.string "provider_secret"
    t.string "token"
    t.datetime "updated_at", null: false
    t.index ["corp_id"], name: "index_wechat_providers_on_corp_id"
  end

  create_table "wechat_qy_medias", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "corpid"
    t.datetime "created_at", null: false
    t.string "media_id"
    t.string "medium_attach"
    t.uuid "medium_id"
    t.string "medium_type"
    t.string "suite_id"
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["corpid"], name: "index_wechat_qy_medias_on_corpid"
    t.index ["medium_type", "medium_id"], name: "index_wechat_qy_medias_on_medium"
    t.index ["suite_id"], name: "index_wechat_qy_medias_on_suite_id"
  end

  create_table "wechat_receivers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "account"
    t.uuid "app_payee_id"
    t.datetime "created_at", null: false
    t.string "custom_relation"
    t.string "name"
    t.string "receiver_type"
    t.string "relation_type"
    t.jsonb "res"
    t.datetime "updated_at", null: false
    t.index ["app_payee_id"], name: "index_wechat_receivers_on_app_payee_id"
  end

  create_table "wechat_registers", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.string "bank_number"
    t.datetime "created_at", null: false
    t.string "email_code"
    t.string "id_name"
    t.string "id_number"
    t.string "mobile"
    t.string "mobile_code"
    t.string "organ_code"
    t.uuid "organ_id"
    t.string "organ_name"
    t.string "password"
    t.string "personal_wechat"
    t.string "state"
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["organ_id"], name: "index_wechat_registers_on_organ_id"
    t.index ["user_id"], name: "index_wechat_registers_on_user_id"
  end

  create_table "wechat_replies", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.jsonb "body"
    t.datetime "created_at"
    t.string "description"
    t.uuid "message_send_id"
    t.uuid "messaging_id"
    t.string "messaging_type"
    t.string "nonce"
    t.string "open_id"
    t.uuid "platform_id"
    t.uuid "request_id"
    t.string "title"
    t.string "type"
    t.string "value"
    t.index ["appid"], name: "index_wechat_replies_on_appid"
    t.index ["message_send_id"], name: "index_wechat_replies_on_message_send_id"
    t.index ["messaging_type", "messaging_id"], name: "index_wechat_replies_on_messaging"
    t.index ["platform_id"], name: "index_wechat_replies_on_platform_id"
    t.index ["request_id"], name: "index_wechat_replies_on_request_id"
  end

  create_table "wechat_request_responses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.datetime "created_at", null: false
    t.string "request_type"
    t.uuid "response_id"
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_wechat_request_responses_on_response_id"
  end

  create_table "wechat_requests", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "aim"
    t.string "appid"
    t.string "body"
    t.datetime "created_at", null: false
    t.string "event"
    t.string "event_key"
    t.integer "handle_id"
    t.string "msg_type"
    t.string "open_id"
    t.uuid "platform_id"
    t.jsonb "raw_body"
    t.uuid "receive_id"
    t.jsonb "reply_body"
    t.uuid "scene_organ_id"
    t.datetime "sent_at"
    t.string "tag_name"
    t.string "type"
    t.datetime "updated_at", null: false
    t.string "userid"
    t.index ["appid"], name: "index_wechat_requests_on_appid"
    t.index ["open_id"], name: "index_wechat_requests_on_open_id"
    t.index ["platform_id"], name: "index_wechat_requests_on_platform_id"
    t.index ["receive_id"], name: "index_wechat_requests_on_receive_id"
    t.index ["scene_organ_id"], name: "index_wechat_requests_on_scene_organ_id"
    t.index ["userid"], name: "index_wechat_requests_on_userid"
  end

  create_table "wechat_responses", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.boolean "contain"
    t.datetime "created_at", null: false
    t.boolean "enabled"
    t.datetime "expire_at"
    t.string "match_value"
    t.uuid "reply_id"
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_responses_on_appid"
    t.index ["reply_id"], name: "index_wechat_responses_on_reply_id"
  end

  create_table "wechat_scenes", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "aim"
    t.string "appid"
    t.datetime "created_at", null: false
    t.string "env_version"
    t.datetime "expire_at"
    t.integer "expire_seconds"
    t.uuid "handle_id"
    t.string "handle_type"
    t.string "match_value"
    t.string "menu_id"
    t.string "note"
    t.uuid "organ_id"
    t.string "qrcode_ticket"
    t.string "qrcode_url"
    t.string "state_uuid"
    t.string "tag_name"
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_scenes_on_appid"
    t.index ["handle_type", "handle_id"], name: "index_wechat_scenes_on_handle"
    t.index ["organ_id"], name: "index_wechat_scenes_on_organ_id"
  end

  create_table "wechat_services", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.jsonb "body"
    t.datetime "created_at", null: false
    t.string "msgtype"
    t.string "open_id"
    t.uuid "request_id"
    t.string "type"
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["request_id"], name: "index_wechat_services_on_request_id"
  end

  create_table "wechat_suite_receives", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "agent_id"
    t.string "auth_corp_id"
    t.string "corpid"
    t.datetime "created_at", null: false
    t.string "encrypt_data"
    t.string "event"
    t.string "event_key"
    t.string "info_type"
    t.jsonb "message_hash"
    t.string "msg_format"
    t.string "msg_id"
    t.string "msg_type"
    t.uuid "provider_id"
    t.string "suiteid"
    t.datetime "updated_at", null: false
    t.string "user_id"
    t.index ["corpid"], name: "index_wechat_suite_receives_on_corpid"
    t.index ["provider_id"], name: "index_wechat_suite_receives_on_provider_id"
    t.index ["suiteid"], name: "index_wechat_suite_receives_on_suiteid"
    t.index ["user_id"], name: "index_wechat_suite_receives_on_user_id"
  end

  create_table "wechat_suites", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "corp_id"
    t.datetime "created_at", null: false
    t.string "encoding_aes_key"
    t.string "kind"
    t.string "name"
    t.string "pre_auth_code"
    t.datetime "pre_auth_code_expires_at"
    t.string "redirect_action", comment: "默认跳转"
    t.string "redirect_controller"
    t.string "secret"
    t.string "suite_id"
    t.string "suite_ticket"
    t.string "suite_ticket_pre"
    t.string "token"
    t.datetime "updated_at", null: false
  end

  create_table "wechat_supporters", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "avatar"
    t.uuid "corp_id"
    t.string "corpid"
    t.datetime "created_at", null: false
    t.boolean "manage_privilege"
    t.string "name"
    t.string "open_kfid"
    t.datetime "updated_at", null: false
    t.index ["corp_id"], name: "index_wechat_supporters_on_corp_id"
    t.index ["corpid"], name: "index_wechat_supporters_on_corpid"
  end

  create_table "wechat_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.integer "count"
    t.datetime "created_at", null: false
    t.string "kind"
    t.string "name"
    t.integer "tag_id"
    t.uuid "tagging_id"
    t.string "tagging_type"
    t.datetime "updated_at", null: false
    t.uuid "user_tag_id"
    t.integer "user_tags_count"
    t.index ["appid"], name: "index_wechat_tags_on_appid"
    t.index ["tagging_type", "tagging_id"], name: "index_wechat_tags_on_tagging"
    t.index ["user_tag_id"], name: "index_wechat_tags_on_user_tag_id"
  end

  create_table "wechat_template_configs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "code"
    t.string "content"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "notifiable_type"
    t.string "tid"
    t.string "title"
    t.string "type"
    t.datetime "updated_at", null: false
  end

  create_table "wechat_template_key_words", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.string "example"
    t.integer "kid"
    t.string "mapping"
    t.string "name"
    t.string "note"
    t.integer "position"
    t.string "rule"
    t.uuid "template_config_id"
    t.datetime "updated_at", null: false
    t.index ["template_config_id"], name: "index_wechat_template_key_words_on_template_config_id"
  end

  create_table "wechat_templates", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.string "content"
    t.datetime "created_at", null: false
    t.string "example"
    t.string "template_id"
    t.string "template_kind"
    t.integer "template_type"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_templates_on_appid"
  end

  create_table "wechat_user_tags", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "appid"
    t.datetime "created_at", null: false
    t.uuid "member_inviter_id"
    t.string "open_id"
    t.boolean "synced"
    t.string "tag_name"
    t.datetime "updated_at", null: false
    t.uuid "user_tagged_id"
    t.index ["appid"], name: "index_wechat_user_tags_on_appid"
    t.index ["member_inviter_id"], name: "index_wechat_user_tags_on_member_inviter_id"
    t.index ["open_id"], name: "index_wechat_user_tags_on_open_id"
    t.index ["tag_name"], name: "index_wechat_user_tags_on_tag_name"
    t.index ["user_tagged_id"], name: "index_wechat_user_tags_on_user_tagged_id"
  end
end
