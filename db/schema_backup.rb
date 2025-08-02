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

ActiveRecord::Schema[8.0].define(version: 2025_07_10_133743) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.string "service_name"
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id"
    t.string "variation_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blob_id"], name: "index_active_storage_variant_records_on_blob_id"
  end

  create_table "agential_agencies", force: :cascade do |t|
    t.string "relation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.bigint "agent_id"
    t.decimal "commission_ratio", precision: 4, scale: 2, comment: "交易时抽成比例"
    t.string "note", comment: "备注"
  end

  create_table "alipay_apps", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "type"
    t.string "name"
    t.string "appid"
    t.string "private_rsa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_alipay_apps_on_organ_id"
  end

  create_table "attend_absence_stats", force: :cascade do |t|
    t.string "year"
    t.float "annual_days"
    t.float "annual_add"
    t.float "left_annual_days"
    t.float "vacation_days"
    t.string "details", limit: 1024
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_id"
    t.index ["member_id"], name: "index_attend_absence_stats_on_member_id"
  end

  create_table "attend_absences", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "merged_id"
    t.string "type"
    t.string "state", default: "init"
    t.float "hours", default: 0.0
    t.string "kind"
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.string "note", limit: 2048
    t.string "comment", limit: 2048
    t.boolean "redeeming"
    t.string "redeeming_days", array: true
    t.boolean "processed"
    t.boolean "divided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_attend_absences_on_member_id"
    t.index ["merged_id"], name: "index_attend_absences_on_merged_id"
  end

  create_table "attend_attendance_logs", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "attendance_id"
    t.string "source", default: "machine"
    t.string "state", default: "init"
    t.string "name"
    t.datetime "record_at", precision: nil
    t.boolean "processed"
    t.string "kind"
    t.string "note"
    t.string "record_at_str"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
    t.index ["attendance_id"], name: "index_attend_attendance_logs_on_attendance_id"
    t.index ["member_id"], name: "index_attend_attendance_logs_on_member_id"
  end

  create_table "attend_attendance_settings", force: :cascade do |t|
    t.bigint "member_id"
    t.string "state", default: "init"
    t.string "on_time", default: "08:30"
    t.string "off_time"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "effect_on"
    t.date "expire_on"
    t.index ["member_id"], name: "index_attend_attendance_settings_on_member_id"
  end

  create_table "attend_attendance_stats", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "financial_month_id"
    t.string "costed_absence", limit: 1024
    t.string "redeeming_absence", limit: 1024
    t.string "free_absence", limit: 1024
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

  create_table "attend_attendances", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "interval_absence_id"
    t.bigint "late_absence_id"
    t.bigint "leave_absence_id"
    t.integer "late_minutes"
    t.integer "leave_minutes"
    t.float "overtime_hours"
    t.float "attend_hours"
    t.float "interval_hours"
    t.float "total_hours"
    t.date "attend_on"
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.datetime "interval_start_at", precision: nil
    t.datetime "interval_finish_at", precision: nil
    t.string "kind"
    t.integer "absence_minutes"
    t.boolean "absence_redeeming"
    t.string "lost_logs", array: true
    t.boolean "workday", default: true
    t.boolean "processed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interval_absence_id"], name: "index_attend_attendances_on_interval_absence_id"
    t.index ["late_absence_id"], name: "index_attend_attendances_on_late_absence_id"
    t.index ["leave_absence_id"], name: "index_attend_attendances_on_leave_absence_id"
    t.index ["member_id"], name: "index_attend_attendances_on_member_id"
  end

  create_table "attend_extra_days", force: :cascade do |t|
    t.bigint "organ_id"
    t.date "the_day"
    t.string "name"
    t.string "kind", comment: "holiday, workday"
    t.string "scope"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_attend_extra_days_on_organ_id"
  end

  create_table "attend_financial_months", force: :cascade do |t|
    t.bigint "organ_id"
    t.date "begin_date"
    t.date "end_date"
    t.string "working_days"
    t.string "color", default: "#8fdf82"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_attend_financial_months_on_organ_id"
  end

  create_table "attend_overtimes", force: :cascade do |t|
    t.bigint "member_id"
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.string "note", limit: 1024
    t.string "comment", limit: 1024
    t.float "hours"
    t.string "state", default: "init"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_attend_overtimes_on_member_id"
  end

  create_table "auditor_approvals", force: :cascade do |t|
    t.string "approving_type"
    t.bigint "approving_id"
    t.string "operator_type"
    t.bigint "operator_id"
    t.string "state", default: "init"
    t.boolean "approved"
    t.json "pending_changes", default: {}
    t.json "related_changes", default: {}
    t.string "comment"
    t.datetime "approved_at", precision: nil
    t.integer "unapproved_approvals_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approving_type", "approving_id"], name: "index_auditor_approvals_on_approving_type_and_approving_id"
    t.index ["operator_type", "operator_id"], name: "index_auditor_approvals_on_operator_type_and_operator_id"
  end

  create_table "auditor_audits", force: :cascade do |t|
    t.string "audited_type"
    t.bigint "audited_id"
    t.string "operator_type"
    t.bigint "operator_id"
    t.string "action", default: "update"
    t.json "audited_changes", default: {}
    t.json "related_changes", default: {}
    t.json "extra", default: {}
    t.string "note", limit: 1024
    t.string "remote_ip"
    t.string "controller_path"
    t.string "action_name"
    t.datetime "created_at", precision: nil, null: false
    t.string "type"
    t.index ["audited_type", "audited_id"], name: "index_auditor_audits_on_audited_type_and_audited_id"
    t.index ["created_at"], name: "index_auditor_audits_on_created_at"
    t.index ["operator_type", "operator_id"], name: "index_auditor_audits_on_operator_type_and_operator_id"
  end

  create_table "auditor_verifications", force: :cascade do |t|
    t.string "verified_type"
    t.bigint "verified_id"
    t.bigint "verifier_id"
    t.bigint "member_id"
    t.bigint "job_title_id"
    t.string "state"
    t.string "note"
    t.integer "position"
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_title_id"], name: "index_auditor_verifications_on_job_title_id"
    t.index ["member_id"], name: "index_auditor_verifications_on_member_id"
    t.index ["verified_type", "verified_id"], name: "index_verifications_on_verified"
    t.index ["verifier_id"], name: "index_auditor_verifications_on_verifier_id"
  end

  create_table "auditor_verifiers", force: :cascade do |t|
    t.string "verifiable_type"
    t.bigint "verifiable_id"
    t.bigint "member_id"
    t.bigint "job_title_id"
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_title_id"], name: "index_auditor_verifiers_on_job_title_id"
    t.index ["member_id"], name: "index_auditor_verifiers_on_member_id"
    t.index ["verifiable_type", "verifiable_id"], name: "index_verifiers_on_verifiable"
  end

  create_table "auth_accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "type"
    t.string "identity"
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source"
    t.index ["user_id"], name: "index_auth_accounts_on_user_id"
  end

  create_table "auth_apps", force: :cascade do |t|
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key"
    t.string "host"
    t.index ["appid"], name: "index_auth_apps_on_appid"
  end

  create_table "auth_authorized_tokens", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "member_id"
    t.string "identity"
    t.datetime "expire_at"
    t.integer "access_counter"
    t.boolean "mock_user"
    t.string "business"
    t.string "uid"
    t.string "session_id"
    t.string "suite_id"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "corp_userid"
    t.bigint "user_id"
    t.string "encrypted_token"
    t.boolean "mock_member"
    t.string "auth_appid"
    t.datetime "online_at"
    t.datetime "offline_at"
    t.index ["identity"], name: "index_auth_authorized_tokens_on_identity"
    t.index ["member_id"], name: "index_auth_authorized_tokens_on_member_id"
    t.index ["user_id"], name: "index_auth_authorized_tokens_on_user_id"
  end

  create_table "auth_disposable_tokens", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "identity"
    t.datetime "used_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identity"], name: "index_auth_disposable_tokens_on_identity"
  end

  create_table "auth_oauth_users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "avatar_url"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "type"
    t.string "access_token"
    t.string "refresh_token"
    t.string "unionid"
    t.string "appid"
    t.datetime "expires_at", precision: nil
    t.string "state"
    t.json "extra", default: {}
    t.string "identity"
    t.string "remark"
    t.datetime "unsubscribe_at"
    t.bigint "user_id"
    t.string "scope"
    t.string "session_key"
    t.boolean "agency_oauth"
    t.datetime "online_at"
    t.datetime "offline_at"
    t.bigint "organ_id"
    t.string "app_name"
    t.string "scene_tag"
    t.boolean "auto_reply"
    t.index ["organ_id"], name: "index_auth_oauth_users_on_organ_id"
    t.index ["user_id"], name: "index_auth_oauth_users_on_user_id"
  end

  create_table "auth_user_taggeds", force: :cascade do |t|
    t.bigint "user_tag_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_auth_user_taggeds_on_user_id"
    t.index ["user_tag_id"], name: "index_auth_user_taggeds_on_user_tag_id"
  end

  create_table "auth_user_tags", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.integer "user_taggeds_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_tagging_type"
    t.bigint "user_tagging_id"
    t.index ["organ_id"], name: "index_auth_user_tags_on_organ_id"
    t.index ["user_tagging_type", "user_tagging_id"], name: "index_user_tags_on_user_tagging"
  end

  create_table "auth_users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "last_login_at", precision: nil
    t.inet "last_login_ip"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "disabled", default: false
    t.integer "pomodoro", default: 25
    t.string "timezone"
    t.string "locale"
    t.string "source"
    t.string "invited_code"
    t.string "notifiable_types", default: [], array: true
    t.jsonb "counters", default: {}
    t.integer "showtime", default: 0
    t.boolean "accept_email", default: true
    t.integer "promote_goods_count", default: 0
    t.bigint "cache_id"
    t.boolean "admin"
    t.index ["cache_id"], name: "index_auth_users_on_cache_id"
  end

  create_table "auth_verify_tokens", force: :cascade do |t|
    t.string "type", limit: 100
    t.string "token"
    t.datetime "expire_at", precision: nil
    t.string "identity"
    t.integer "access_counter", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "bench_facilitate_indicators", force: :cascade do |t|
    t.bigint "facilitate_id"
    t.bigint "facilitate_taxon_id"
    t.bigint "indicator_id"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_facilitate_indicators_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_bench_facilitate_indicators_on_facilitate_taxon_id"
    t.index ["indicator_id"], name: "index_bench_facilitate_indicators_on_indicator_id"
  end

  create_table "bench_facilitate_providers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "facilitate_id"
    t.bigint "provider_id"
    t.boolean "selected"
    t.string "note"
    t.index ["facilitate_id"], name: "index_bench_facilitate_providers_on_facilitate_id"
    t.index ["provider_id"], name: "index_bench_facilitate_providers_on_provider_id"
  end

  create_table "bench_facilitate_taxon_hierarchies", force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "facilitate_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "facilitate_taxon_desc_idx"
  end

  create_table "bench_facilitate_taxons", force: :cascade do |t|
    t.string "name"
    t.integer "position", default: 0
    t.integer "facilitates_count", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "parent_id"
    t.json "parent_ancestors"
    t.string "color"
    t.string "description"
    t.integer "indicators_count", default: 0
    t.bigint "taxon_id"
    t.bigint "organ_id"
    t.index ["organ_id"], name: "index_bench_facilitate_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_bench_facilitate_taxons_on_parent_id"
    t.index ["taxon_id"], name: "index_bench_facilitate_taxons_on_taxon_id"
  end

  create_table "bench_facilitates", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "facilitate_taxon_id"
    t.decimal "price", precision: 10, scale: 2
    t.string "sku"
    t.string "qr_prefix"
    t.decimal "quantity"
    t.string "unit"
    t.boolean "published", default: true
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.decimal "unified_quantity", default: "1.0"
    t.string "good_type"
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.bigint "organ_id"
    t.bigint "standard_id"
    t.decimal "step", comment: "Item Number Step"
    t.index ["facilitate_taxon_id"], name: "index_bench_facilitates_on_facilitate_taxon_id"
    t.index ["organ_id"], name: "index_bench_facilitates_on_organ_id"
    t.index ["standard_id"], name: "index_bench_facilitates_on_standard_id"
  end

  create_table "bench_facilitatings", force: :cascade do |t|
    t.bigint "facilitate_id"
    t.bigint "facilitator_id"
    t.bigint "member_id"
    t.bigint "wallet_payment_id"
    t.bigint "item_id"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.datetime "estimate_finish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_facilitatings_on_facilitate_id"
    t.index ["facilitator_id"], name: "index_bench_facilitatings_on_facilitator_id"
    t.index ["item_id"], name: "index_bench_facilitatings_on_item_id"
    t.index ["member_id"], name: "index_bench_facilitatings_on_member_id"
    t.index ["wallet_payment_id"], name: "index_bench_facilitatings_on_wallet_payment_id"
  end

  create_table "bench_facilitators", force: :cascade do |t|
    t.bigint "facilitate_id"
    t.bigint "member_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["facilitate_id"], name: "index_bench_facilitators_on_facilitate_id"
    t.index ["member_id"], name: "index_bench_facilitators_on_member_id"
  end

  create_table "bench_indicators", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "unit"
    t.decimal "reference_min"
    t.decimal "reference_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "target_source"
  end

  create_table "bench_mileposts", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.integer "position"
    t.integer "project_mileposts_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bench_mileposts_on_organ_id"
  end

  create_table "bench_project_facilitates", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "facilitate_taxon_id"
    t.bigint "facilitate_id"
    t.bigint "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_project_facilitates_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_bench_project_facilitates_on_facilitate_taxon_id"
    t.index ["project_id"], name: "index_bench_project_facilitates_on_project_id"
    t.index ["provider_id"], name: "index_bench_project_facilitates_on_provider_id"
  end

  create_table "bench_project_indicators", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "indicator_id"
    t.date "recorded_on"
    t.datetime "recorded_at", precision: nil
    t.string "value"
    t.string "source"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.index ["indicator_id"], name: "index_bench_project_indicators_on_indicator_id"
    t.index ["project_id"], name: "index_bench_project_indicators_on_project_id"
  end

  create_table "bench_project_mileposts", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "milepost_id"
    t.date "recorded_on"
    t.boolean "current"
    t.string "milepost_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["milepost_id"], name: "index_bench_project_mileposts_on_milepost_id"
    t.index ["project_id"], name: "index_bench_project_mileposts_on_project_id"
  end

  create_table "bench_project_stages", force: :cascade do |t|
    t.string "name"
    t.date "begin_on"
    t.date "end_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.decimal "fund_budget"
    t.decimal "fund_expense"
    t.decimal "budget_amount"
    t.decimal "expense_amount"
    t.integer "projects_count"
  end

  create_table "bench_project_webhooks", force: :cascade do |t|
    t.bigint "project_id"
    t.json "origin_data"
    t.json "valuable_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["project_id"], name: "index_bench_project_webhooks_on_project_id"
  end

  create_table "bench_projects", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id"
    t.bigint "taxon_id"
    t.string "state"
    t.jsonb "extra"
    t.decimal "fund_expense"
    t.decimal "fund_budget"
    t.decimal "expense_amount"
    t.decimal "budget_amount"
    t.index ["organ_id"], name: "index_bench_projects_on_organ_id"
    t.index ["taxon_id"], name: "index_bench_projects_on_taxon_id"
  end

  create_table "bench_schedules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bench_standard_providers", force: :cascade do |t|
    t.bigint "facilitate_id"
    t.boolean "selected", default: false
    t.string "note"
    t.decimal "export_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_standard_providers_on_facilitate_id"
  end

  create_table "bench_standards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bench_task_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "task_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "task_desc_idx"
  end

  create_table "bench_task_template_hierarchies", force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "task_template_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "task_template_desc_idx"
  end

  create_table "bench_task_templates", force: :cascade do |t|
    t.string "title"
    t.integer "parent_id"
    t.integer "position", default: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "taxon_id"
    t.bigint "organ_id"
    t.bigint "job_title_id"
    t.bigint "member_id"
    t.jsonb "parent_ancestors"
    t.string "color"
    t.bigint "department_id"
    t.string "repeat_type", default: "once"
    t.integer "repeat_days", array: true
    t.index ["department_id"], name: "index_bench_task_templates_on_department_id"
    t.index ["job_title_id"], name: "index_bench_task_templates_on_job_title_id"
    t.index ["member_id"], name: "index_bench_task_templates_on_member_id"
    t.index ["organ_id"], name: "index_bench_task_templates_on_organ_id"
  end

  create_table "bench_task_timers", id: :serial, force: :cascade do |t|
    t.integer "task_id"
    t.integer "duration"
    t.datetime "finish_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["task_id"], name: "index_bench_task_timers_on_task_id"
  end

  create_table "bench_tasks", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "parent_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "state", default: "0"
    t.string "focus", default: "0"
    t.integer "position", default: 1
    t.integer "estimated_time"
    t.integer "actual_time"
    t.datetime "done_at", precision: nil
    t.integer "children_count", default: 0
    t.bigint "member_id"
    t.bigint "user_id"
    t.datetime "start_at", precision: nil
    t.json "parent_ancestors"
    t.bigint "organ_id"
    t.bigint "job_title_id"
    t.bigint "project_id"
    t.bigint "task_template_id"
    t.string "note"
    t.bigint "department_id"
    t.string "serial_number", comment: "Task Template test repeat"
    t.decimal "cost_fund"
    t.integer "cost_stock"
    t.date "deadline_on"
    t.index ["department_id"], name: "index_bench_tasks_on_department_id"
    t.index ["job_title_id"], name: "index_bench_tasks_on_job_title_id"
    t.index ["member_id"], name: "index_bench_tasks_on_member_id"
    t.index ["organ_id"], name: "index_bench_tasks_on_organ_id"
    t.index ["task_template_id"], name: "index_bench_tasks_on_task_template_id"
    t.index ["user_id"], name: "index_bench_tasks_on_user_id"
  end

  create_table "bench_taxon_facilitates", force: :cascade do |t|
    t.bigint "taxon_id"
    t.bigint "facilitate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_taxon_facilitates_on_facilitate_id"
    t.index ["taxon_id"], name: "index_bench_taxon_facilitates_on_taxon_id"
  end

  create_table "bench_taxon_indicators", force: :cascade do |t|
    t.bigint "taxon_id"
    t.bigint "indicator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weight"
    t.index ["indicator_id"], name: "index_bench_taxon_indicators_on_indicator_id"
    t.index ["taxon_id"], name: "index_bench_taxon_indicators_on_taxon_id"
  end

  create_table "bench_taxons", force: :cascade do |t|
    t.string "record_name"
    t.string "name"
    t.integer "projects_count", default: 0
    t.jsonb "parameters", default: {}
    t.decimal "fund_budget", default: "0.0"
    t.decimal "fund_expense", default: "0.0"
    t.decimal "budget_amount", default: "0.0"
    t.decimal "expense_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bluetooth_devices", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bluetooth_devices_on_organ_id"
  end

  create_table "bluetooth_errs", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bluetooth_errs_on_organ_id"
  end

  create_table "cms_audio_tags", force: :cascade do |t|
    t.bigint "audio_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audio_id"], name: "index_cms_audio_tags_on_audio_id"
    t.index ["tag_id"], name: "index_cms_audio_tags_on_tag_id"
  end

  create_table "cms_audios", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "organ_id"
    t.string "title"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_cms_audios_on_author_id"
    t.index ["organ_id"], name: "index_cms_audios_on_organ_id"
  end

  create_table "cms_carousels", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "title"
    t.integer "position"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled"
    t.index ["organ_id"], name: "index_cms_carousels_on_organ_id"
  end

  create_table "cms_covers", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_cms_covers_on_organ_id"
  end

  create_table "cms_progressions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "progressive_type"
    t.bigint "progressive_id"
    t.decimal "ratio", comment: "完成比例"
    t.decimal "time"
    t.decimal "duration"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["progressive_type", "progressive_id"], name: "index_cms_progressions_on_progressive"
    t.index ["user_id"], name: "index_cms_progressions_on_user_id"
  end

  create_table "cms_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cms_videos", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "organ_id"
    t.bigint "video_taxon_id"
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

  create_table "com_acme_accounts", force: :cascade do |t|
    t.string "email"
    t.string "kid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_acme_domains", force: :cascade do |t|
    t.bigint "acme_servicer_id"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acme_servicer_id"], name: "index_com_acme_domains_on_acme_servicer_id"
  end

  create_table "com_acme_identifiers", force: :cascade do |t|
    t.bigint "acme_order_id"
    t.string "identifier"
    t.string "file_name"
    t.string "file_content"
    t.string "record_name"
    t.string "record_content"
    t.string "domain"
    t.boolean "wildcard"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "status"
    t.string "type"
    t.string "domain_root"
    t.index ["acme_order_id"], name: "index_com_acme_identifiers_on_acme_order_id"
  end

  create_table "com_acme_orders", force: :cascade do |t|
    t.bigint "acme_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "orderid"
    t.string "url"
    t.string "status"
    t.datetime "issued_at", precision: nil
    t.datetime "expire_at", comment: "过期时间"
    t.string "identifiers", array: true
    t.string "sync_host"
    t.string "sync_path"
    t.index ["acme_account_id"], name: "index_com_acme_orders_on_acme_account_id"
  end

  create_table "com_acme_servicers", force: :cascade do |t|
    t.string "type"
    t.string "key"
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_blob_defaults", force: :cascade do |t|
    t.string "record_class", comment: "AR 类名，如 User"
    t.string "name", comment: "名称, attach 名称，如：avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "macro"
  end

  create_table "com_blob_pdfs", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_blob_temps", force: :cascade do |t|
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_cache_lists", force: :cascade do |t|
    t.string "path"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_counter_days", force: :cascade do |t|
    t.bigint "counter_id"
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.string "year_month"
    t.date "date"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counter_id"], name: "index_com_counter_days_on_counter_id"
    t.index ["year_month"], name: "index_com_counter_days_on_year_month"
  end

  create_table "com_counter_months", force: :cascade do |t|
    t.bigint "counter_id"
    t.integer "year"
    t.integer "month"
    t.string "year_month"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counter_id"], name: "index_com_counter_months_on_counter_id"
    t.index ["year_month"], name: "index_com_counter_months_on_year_month"
  end

  create_table "com_counter_years", force: :cascade do |t|
    t.bigint "counter_id"
    t.integer "year"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counter_id"], name: "index_com_counter_years_on_counter_id"
  end

  create_table "com_counters", force: :cascade do |t|
    t.string "countable_type"
    t.bigint "countable_id"
    t.jsonb "extra"
    t.integer "count"
    t.boolean "cached"
    t.integer "counter_years_count"
    t.integer "counter_months_count"
    t.integer "counter_days_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["countable_type", "countable_id"], name: "index_com_counters_on_countable"
  end

  create_table "com_csps", force: :cascade do |t|
    t.string "document_uri"
    t.string "referrer"
    t.string "violated_directive"
    t.string "effective_directive"
    t.string "original_policy", limit: 1024
    t.string "disposition"
    t.string "blocked_uri"
    t.string "line_number"
    t.string "column_number"
    t.string "source_file"
    t.string "status_code"
    t.string "script_sample"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "com_debug_manies", force: :cascade do |t|
    t.bigint "debug_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debug_id"], name: "index_com_debug_manies_on_debug_id"
  end

  create_table "com_debugs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state", default: "init"
  end

  create_table "com_detector_bots", force: :cascade do |t|
    t.bigint "detector_id"
    t.string "type"
    t.string "hook_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detector_id"], name: "index_com_detector_bots_on_detector_id"
  end

  create_table "com_detector_logs", force: :cascade do |t|
    t.bigint "detector_id"
    t.string "status"
    t.string "body"
    t.string "error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.datetime "started_at"
    t.integer "spend", comment: "单位为毫秒"
    t.index ["detector_id"], name: "index_com_detector_logs_on_detector_id"
  end

  create_table "com_detectors", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_err_bots", force: :cascade do |t|
    t.string "type"
    t.string "hook_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "first_time"
    t.string "secret"
    t.string "base_url"
    t.string "hook_key"
  end

  create_table "com_err_notices", force: :cascade do |t|
    t.bigint "err_bot_id"
    t.string "controller_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name"], name: "index_com_err_notices_on_controller_name"
    t.index ["err_bot_id"], name: "index_com_err_notices_on_err_bot_id"
  end

  create_table "com_err_summaries", force: :cascade do |t|
    t.string "controller_name"
    t.string "action_name"
    t.string "exception_object"
    t.integer "errs_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_errs", id: :serial, force: :cascade do |t|
    t.string "path"
    t.string "controller_name"
    t.string "action_name"
    t.string "exception", limit: 10240
    t.string "exception_object"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "ip"
    t.jsonb "headers"
    t.jsonb "params"
    t.jsonb "cookie"
    t.jsonb "session"
    t.string "exception_backtrace", array: true
  end

  create_table "com_filter_columns", force: :cascade do |t|
    t.bigint "filter_id"
    t.string "column"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filter_id"], name: "index_com_filter_columns_on_filter_id"
  end

  create_table "com_filters", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "controller_path", null: false
    t.string "action_name"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_path", "action_name"], name: "index_com_filters_on_controller_path_and_action_name"
    t.index ["organ_id"], name: "index_com_filters_on_organ_id"
  end

  create_table "com_infos", force: :cascade do |t|
    t.string "code"
    t.string "value"
    t.string "version"
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_meta_actions", force: :cascade do |t|
    t.string "namespace_identifier", default: "", null: false
    t.string "business_identifier", default: "", null: false
    t.string "controller_path", null: false
    t.string "controller_name", null: false
    t.string "action_name"
    t.string "path"
    t.string "verb"
    t.integer "position"
    t.boolean "landmark"
    t.string "operation", default: "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "synced_at"
    t.string "required_parts", array: true
    t.index ["business_identifier"], name: "index_com_meta_actions_on_business_identifier"
    t.index ["controller_path"], name: "index_com_meta_actions_on_controller_path"
    t.index ["namespace_identifier"], name: "index_com_meta_actions_on_namespace_identifier"
  end

  create_table "com_meta_businesses", force: :cascade do |t|
    t.string "name"
    t.string "identifier", default: "", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "synced_at"
    t.index ["identifier"], name: "index_com_meta_businesses_on_identifier"
  end

  create_table "com_meta_columns", force: :cascade do |t|
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

  create_table "com_meta_controllers", force: :cascade do |t|
    t.string "namespace_identifier", default: "", null: false
    t.string "business_identifier", default: "", null: false
    t.string "controller_path", null: false
    t.string "controller_name", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "synced_at"
    t.index ["business_identifier"], name: "index_com_meta_controllers_on_business_identifier"
    t.index ["controller_path"], name: "index_com_meta_controllers_on_controller_path"
    t.index ["namespace_identifier"], name: "index_com_meta_controllers_on_namespace_identifier"
  end

  create_table "com_meta_models", force: :cascade do |t|
    t.string "name"
    t.string "record_name"
    t.string "description"
    t.boolean "defined_db"
    t.boolean "customizable", comment: "是否允许用户定制"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "business_identifier", null: false
    t.string "table_name"
    t.index ["record_name"], name: "index_com_meta_models_on_record_name"
  end

  create_table "com_meta_namespaces", force: :cascade do |t|
    t.string "name"
    t.string "identifier", default: "", null: false
    t.boolean "verify_organ"
    t.boolean "verify_member"
    t.boolean "verify_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_com_meta_namespaces_on_identifier"
  end

  create_table "com_meta_operations", force: :cascade do |t|
    t.string "action_name"
    t.string "operation", default: "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_ssh_keys", force: :cascade do |t|
    t.string "host"
    t.string "private_key"
    t.string "public_key"
    t.string "fingerprint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.jsonb "extra"
    t.string "ssh_user"
    t.index ["user_id"], name: "index_com_ssh_keys_on_user_id"
  end

  create_table "com_state_hierarchies", force: :cascade do |t|
    t.uuid "ancestor_id"
    t.uuid "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "com/state_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_com_state_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_com_state_hierarchies_on_descendant_id"
  end

  create_table "com_states", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organ_id"
    t.string "host"
    t.string "path"
    t.string "controller_path"
    t.string "action_name"
    t.string "request_method"
    t.string "referer"
    t.jsonb "params"
    t.jsonb "body"
    t.jsonb "cookie"
    t.jsonb "session"
    t.boolean "destroyable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.jsonb "parent_ancestors"
    t.uuid "parent_id"
    t.string "session_id"
    t.index ["organ_id"], name: "index_com_states_on_organ_id"
    t.index ["user_id"], name: "index_com_states_on_user_id"
  end

  create_table "com_statistic_configs", force: :cascade do |t|
    t.string "statistical_type"
    t.bigint "statistical_id"
    t.integer "year"
    t.date "begin_on"
    t.date "end_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["statistical_type", "statistical_id"], name: "index_com_statistic_configs_on_statistical"
  end

  create_table "com_statistic_days", force: :cascade do |t|
    t.bigint "statistic_id"
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year_month"
    t.date "date"
    t.index ["statistic_id"], name: "index_com_statistic_days_on_statistic_id"
    t.index ["year_month"], name: "index_com_statistic_days_on_year_month"
  end

  create_table "com_statistic_months", force: :cascade do |t|
    t.bigint "statistic_id"
    t.integer "year"
    t.integer "month"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year_month"
    t.index ["statistic_id"], name: "index_com_statistic_months_on_statistic_id"
    t.index ["year_month"], name: "index_com_statistic_months_on_year_month"
  end

  create_table "com_statistic_years", force: :cascade do |t|
    t.bigint "statistic_id"
    t.integer "year"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["statistic_id"], name: "index_com_statistic_years_on_statistic_id"
  end

  create_table "com_statistics", force: :cascade do |t|
    t.string "column"
    t.string "value"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "statistical_type"
    t.bigint "statistical_id"
    t.boolean "cached"
    t.integer "statistic_years_count"
    t.integer "statistic_months_count"
    t.integer "statistic_days_count"
    t.index ["statistical_type", "statistical_id"], name: "index_com_statistics_on_statistical"
  end

  create_table "crm_agencies", force: :cascade do |t|
    t.string "agent_type"
    t.bigint "agent_id"
    t.string "client_type"
    t.bigint "client_id"
    t.string "relation", default: "unknown"
    t.decimal "commission_ratio", comment: "交易时抽成比例"
    t.string "note", comment: "备注"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_type", "agent_id"], name: "index_crm_agencies_on_agent"
    t.index ["client_type", "client_id"], name: "index_crm_agencies_on_client"
  end

  create_table "crm_client_hierarchies", force: :cascade do |t|
    t.bigint "ancestor_id"
    t.bigint "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "crm/client_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_crm_client_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_crm_client_hierarchies_on_descendant_id"
  end

  create_table "crm_clients", force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "organ_id"
    t.bigint "client_organ_id"
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

  create_table "crm_contacts", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "client_member_id"
    t.bigint "client_user_id"
    t.bigint "client_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "wechat_openid"
    t.index ["client_id"], name: "index_crm_contacts_on_client_id"
    t.index ["client_member_id"], name: "index_crm_contacts_on_client_member_id"
    t.index ["client_user_id"], name: "index_crm_contacts_on_client_user_id"
    t.index ["organ_id"], name: "index_crm_contacts_on_organ_id"
    t.index ["unionid"], name: "index_crm_contacts_on_unionid"
  end

  create_table "crm_maintain_logs", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "maintain_id"
    t.string "logged_type"
    t.bigint "logged_id"
    t.bigint "maintain_tag_id"
    t.string "note"
    t.string "tag_str"
    t.integer "tag_sequence"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["logged_type", "logged_id"], name: "index_crm_maintain_logs_on_logged"
    t.index ["maintain_id"], name: "index_crm_maintain_logs_on_maintain_id"
    t.index ["maintain_tag_id"], name: "index_crm_maintain_logs_on_maintain_tag_id"
    t.index ["member_id"], name: "index_crm_maintain_logs_on_member_id"
  end

  create_table "crm_maintain_sources", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "source_id"
    t.string "name"
    t.integer "maintains_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_crm_maintain_sources_on_organ_id"
    t.index ["source_id"], name: "index_crm_maintain_sources_on_source_id"
  end

  create_table "crm_maintain_tags", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "tag_id"
    t.string "name"
    t.string "logged_type"
    t.string "entity_column"
    t.string "entity_value"
    t.integer "sequence", default: 1
    t.boolean "manual", default: true
    t.string "color", default: "#2A92CA"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "notes_count"
    t.index ["organ_id"], name: "index_crm_maintain_tags_on_organ_id"
    t.index ["tag_id"], name: "index_crm_maintain_tags_on_tag_id"
  end

  create_table "crm_maintains", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "member_id"
    t.bigint "task_template_id"
    t.bigint "client_id"
    t.string "agent_type"
    t.bigint "agent_id"
    t.bigint "agency_id"
    t.bigint "maintain_source_id"
    t.bigint "upstream_id"
    t.bigint "original_id"
    t.integer "position"
    t.string "state", default: "init"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "remark"
    t.string "description"
    t.string "oper_userid"
    t.string "add_way"
    t.string "external_userid"
    t.string "pending_id"
    t.jsonb "remark_mobiles"
    t.bigint "contact_id"
    t.index ["agency_id"], name: "index_crm_maintains_on_agency_id"
    t.index ["agent_type", "agent_id"], name: "index_crm_maintains_on_agent"
    t.index ["contact_id"], name: "index_crm_maintains_on_contact_id"
    t.index ["maintain_source_id"], name: "index_crm_maintains_on_maintain_source_id"
    t.index ["member_id"], name: "index_crm_maintains_on_member_id"
    t.index ["organ_id"], name: "index_crm_maintains_on_organ_id"
    t.index ["original_id"], name: "index_crm_maintains_on_original_id"
    t.index ["task_template_id"], name: "index_crm_maintains_on_task_template_id"
    t.index ["upstream_id"], name: "index_crm_maintains_on_upstream_id"
  end

  create_table "crm_notes", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "client_id"
    t.bigint "contact_id"
    t.string "logged_type"
    t.bigint "logged_id"
    t.bigint "maintain_tag_id"
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

  create_table "crm_qrcodes", force: :cascade do |t|
    t.bigint "source_id"
    t.integer "margin_x", default: 0
    t.integer "margin_y", default: 0
    t.integer "fixed_width", default: 0
    t.string "align", default: "northwest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_crm_qrcodes_on_source_id"
  end

  create_table "crm_source_contacts", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "maintain_source_id"
    t.bigint "source_id"
    t.bigint "contact_id"
    t.bigint "trade_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_crm_source_contacts_on_contact_id"
    t.index ["maintain_source_id"], name: "index_crm_source_contacts_on_maintain_source_id"
    t.index ["organ_id"], name: "index_crm_source_contacts_on_organ_id"
    t.index ["source_id"], name: "index_crm_source_contacts_on_source_id"
    t.index ["trade_item_id"], name: "index_crm_source_contacts_on_trade_item_id"
  end

  create_table "crm_source_hierarchies", force: :cascade do |t|
    t.bigint "ancestor_id"
    t.bigint "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "crm/source_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_crm_source_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_crm_source_hierarchies_on_descendant_id"
  end

  create_table "crm_sources", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "name"
    t.boolean "materialize", default: false
    t.integer "fixed_width", default: 0
    t.jsonb "parent_ancestors", default: {}
    t.string "sku"
    t.decimal "price", default: "0.0"
    t.decimal "advance_price", default: "0.0"
    t.jsonb "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.string "good_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.decimal "step", comment: "Item Number Step"
    t.index ["parent_id"], name: "index_crm_sources_on_parent_id"
  end

  create_table "crm_tags", force: :cascade do |t|
    t.string "name"
    t.string "logged_type"
    t.string "entity_column"
    t.string "entity_value"
    t.string "color"
    t.integer "sequence", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crm_texts", force: :cascade do |t|
    t.bigint "source_id"
    t.string "note"
    t.integer "margin_x", default: 0
    t.integer "margin_y", default: 0
    t.string "font", default: "simsun"
    t.string "align", default: "northwest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_crm_texts_on_source_id"
  end

  create_table "datum_data_lists", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "comment", limit: 4096
    t.string "type"
    t.string "data_table"
    t.string "export_excel"
    t.string "export_pdf"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.jsonb "parameters"
    t.jsonb "columns"
    t.integer "x_position"
  end

  create_table "datum_export_items", force: :cascade do |t|
    t.bigint "export_id"
    t.jsonb "fields"
    t.integer "position"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["export_id"], name: "index_datum_export_items_on_export_id"
  end

  create_table "datum_exports", force: :cascade do |t|
    t.bigint "template_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.jsonb "formats"
    t.jsonb "editable"
    t.index ["template_id"], name: "index_datum_exports_on_template_id"
  end

  create_table "datum_record_lists", id: :serial, force: :cascade do |t|
    t.integer "data_list_id"
    t.boolean "done"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.jsonb "parameters"
    t.jsonb "columns"
    t.index ["data_list_id"], name: "index_datum_record_lists_on_data_list_id"
  end

  create_table "datum_table_items", id: :serial, force: :cascade do |t|
    t.integer "table_list_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "fields", array: true
    t.index ["table_list_id"], name: "index_datum_table_items_on_table_list_id"
  end

  create_table "datum_table_lists", id: :serial, force: :cascade do |t|
    t.integer "data_list_id"
    t.integer "table_items_count", default: 0
    t.string "timestamp"
    t.boolean "done"
    t.boolean "published"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "headers", array: true
    t.string "footers", array: true
    t.jsonb "parameters"
    t.jsonb "extra", default: {}
    t.index ["data_list_id"], name: "index_datum_table_lists_on_data_list_id"
  end

  create_table "datum_template_items", force: :cascade do |t|
    t.bigint "template_id"
    t.jsonb "fields"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_datum_template_items_on_template_id"
  end

  create_table "datum_templates", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.jsonb "headers"
    t.integer "header_line"
    t.integer "template_items_count"
    t.jsonb "parameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.datetime "uploaded_at"
    t.index ["organ_id"], name: "index_datum_templates_on_organ_id"
  end

  create_table "datum_validations", force: :cascade do |t|
    t.bigint "template_id"
    t.string "sheet"
    t.string "header"
    t.jsonb "fields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_datum_validations_on_template_id"
  end

  create_table "debug_manies", force: :cascade do |t|
    t.bigint "one_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["one_id"], name: "index_debug_manies_on_one_id"
  end

  create_table "debug_muches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debug_ones", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debug_throughs", force: :cascade do |t|
    t.bigint "many_id"
    t.bigint "much_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["many_id"], name: "index_debug_throughs_on_many_id"
    t.index ["much_id"], name: "index_debug_throughs_on_much_id"
  end

  create_table "detail_contents", force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.text "body"
    t.integer "position", default: 0
    t.string "list", limit: 50
    t.bigint "detail_id"
    t.bigint "author_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "detail_type"
    t.index ["author_id"], name: "index_detail_contents_on_author_id"
    t.index ["detail_id"], name: "index_detail_contents_on_detail_id"
  end

  create_table "detail_entity_items", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "item_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "value"
    t.string "entity_type"
    t.bigint "entity_id"
    t.bigint "taxon_item_id"
    t.index ["entity_type", "entity_id"], name: "index_detail_entity_items_on_entity_type_and_entity_id"
    t.index ["item_id"], name: "index_detail_entity_items_on_item_id"
    t.index ["list_id"], name: "index_detail_entity_items_on_list_id"
    t.index ["taxon_item_id"], name: "index_detail_entity_items_on_taxon_item_id"
  end

  create_table "detail_items", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "key"
    t.string "description", limit: 1024
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "list_id"
    t.index ["list_id"], name: "index_detail_items_on_list_id"
  end

  create_table "detail_knowings", force: :cascade do |t|
    t.string "knowable_type"
    t.bigint "knowable_id"
    t.bigint "knowledge_id"
    t.boolean "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["knowable_type", "knowable_id"], name: "index_detail_knowings_on_knowable_type_and_knowable_id"
    t.index ["knowledge_id"], name: "index_detail_knowings_on_knowledge_id"
  end

  create_table "detail_knowledge_hierarchies", force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "knowledge_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "knowledge_desc_idx"
  end

  create_table "detail_knowledges", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "title"
    t.text "body"
    t.integer "position"
    t.json "parent_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_detail_knowledges_on_parent_id"
  end

  create_table "detail_lists", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "items_count", default: 0
    t.integer "status", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id"
    t.index ["organ_id"], name: "index_detail_lists_on_organ_id"
  end

  create_table "detail_post_syncs", force: :cascade do |t|
    t.bigint "post_id"
    t.string "synced_type"
    t.bigint "synced_id"
    t.datetime "synced_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source_id"
    t.index ["post_id"], name: "index_detail_post_syncs_on_post_id"
    t.index ["synced_type", "synced_id"], name: "index_detail_post_syncs_on_synced_type_and_synced_id"
  end

  create_table "detail_posts", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "title"
    t.string "content"
    t.string "link"
    t.bigint "organ_id"
    t.string "thumb_media_id"
    t.index ["organ_id"], name: "index_detail_posts_on_organ_id"
  end

  create_table "detail_taxon_items", force: :cascade do |t|
    t.string "taxon_type"
    t.bigint "taxon_id"
    t.bigint "list_id"
    t.bigint "item_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "default_value"
    t.index ["item_id"], name: "index_detail_taxon_items_on_item_id"
    t.index ["list_id"], name: "index_detail_taxon_items_on_list_id"
    t.index ["taxon_type", "taxon_id"], name: "index_detail_taxon_items_on_taxon_type_and_taxon_id"
  end

  create_table "doc_maps", force: :cascade do |t|
    t.string "name"
    t.jsonb "mappings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doc_subjects", force: :cascade do |t|
    t.bigint "rule_id"
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

  create_table "douyin_apps", force: :cascade do |t|
    t.bigint "organ_id"
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

  create_table "douyin_orders", force: :cascade do |t|
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

  create_table "douyin_shops", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.string "appid"
    t.string "poi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_douyin_shops_on_appid"
    t.index ["organ_id"], name: "index_douyin_shops_on_organ_id"
  end

  create_table "email_logs", force: :cascade do |t|
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
    t.bigint "template_id"
    t.string "mail_from"
    t.index ["template_id"], name: "index_email_logs_on_template_id"
  end

  create_table "email_reasons", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_smtp_accounts", force: :cascade do |t|
    t.bigint "smtp_id"
    t.string "user_name"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["smtp_id"], name: "index_email_smtp_accounts_on_smtp_id"
  end

  create_table "email_smtps", force: :cascade do |t|
    t.string "address"
    t.string "port"
    t.boolean "enable_starttls_auto"
    t.boolean "ssl"
    t.string "authentication"
    t.string "openssl_verify_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_subscriptions", force: :cascade do |t|
    t.bigint "smtp_id"
    t.bigint "smtp_account_id"
    t.string "address"
    t.string "state"
    t.datetime "subscribe_at", precision: nil
    t.datetime "unsubscribe_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "reason_id"
    t.index ["reason_id"], name: "index_email_subscriptions_on_reason_id"
    t.index ["smtp_account_id"], name: "index_email_subscriptions_on_smtp_account_id"
    t.index ["smtp_id"], name: "index_email_subscriptions_on_smtp_id"
  end

  create_table "email_templates", force: :cascade do |t|
    t.string "honorific"
    t.string "body"
    t.string "order_prefix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.string "contact"
    t.string "subject"
    t.bigint "organ_id"
    t.index ["organ_id"], name: "index_email_templates_on_organ_id"
  end

  create_table "event_participants", force: :cascade do |t|
    t.bigint "event_id"
    t.string "participant_type"
    t.bigint "participant_id"
    t.string "state"
    t.integer "score"
    t.string "comment", limit: 4096
    t.string "quit_note"
    t.string "assigned_status"
    t.string "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_crowd_id"
    t.integer "crowd_member_id"
    t.index ["event_crowd_id"], name: "index_event_participants_on_event_crowd_id"
    t.index ["event_id"], name: "index_event_participants_on_event_id"
    t.index ["participant_type", "participant_id"], name: "index_event_participants_on_participant_type_and_participant_id"
  end

  create_table "eventual_bookings", id: :serial, force: :cascade do |t|
    t.string "booker_type"
    t.integer "booker_id"
    t.string "booked_type"
    t.integer "booked_id"
    t.integer "plan_item_id"
    t.integer "time_item_id"
    t.integer "place_id"
    t.date "booking_on"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "seat_id"
    t.index ["booked_type", "booked_id"], name: "index_eventual_bookings_on_booked_type_and_booked_id"
    t.index ["booker_type", "booker_id"], name: "index_eventual_bookings_on_booker_type_and_booker_id"
    t.index ["place_id"], name: "index_eventual_bookings_on_place_id"
    t.index ["plan_item_id"], name: "index_eventual_bookings_on_plan_item_id"
    t.index ["seat_id"], name: "index_eventual_bookings_on_seat_id"
    t.index ["time_item_id"], name: "index_eventual_bookings_on_time_item_id"
  end

  create_table "eventual_crowd_members", force: :cascade do |t|
    t.bigint "crowd_id"
    t.string "member_type"
    t.bigint "member_id"
    t.bigint "agency_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_eventual_crowd_members_on_agency_id"
    t.index ["crowd_id"], name: "index_eventual_crowd_members_on_crowd_id"
    t.index ["member_type", "member_id"], name: "index_eventual_crowd_members_on_member_type_and_member_id"
  end

  create_table "eventual_crowds", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.string "member_type"
    t.integer "crowd_members_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_eventual_crowds_on_organ_id"
  end

  create_table "eventual_event_crowds", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "crowd_id"
    t.integer "present_number", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crowd_id"], name: "index_eventual_event_crowds_on_crowd_id"
    t.index ["event_id"], name: "index_eventual_event_crowds_on_event_id"
  end

  create_table "eventual_event_grants", force: :cascade do |t|
    t.bigint "event_id"
    t.string "grant_kind"
    t.string "grant_column"
    t.jsonb "filter", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_eventual_event_grants_on_event_id"
  end

  create_table "eventual_event_items", force: :cascade do |t|
    t.bigint "event_id"
    t.string "name"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_eventual_event_items_on_author_id"
    t.index ["event_id"], name: "index_eventual_event_items_on_event_id"
  end

  create_table "eventual_event_participants", force: :cascade do |t|
    t.bigint "event_crowd_id"
    t.bigint "event_id"
    t.bigint "crowd_member_id"
    t.string "participant_type"
    t.bigint "participant_id"
    t.integer "score"
    t.string "comment"
    t.string "quit_note"
    t.string "assigned_status"
    t.string "job_id"
    t.string "state", default: "in_studying"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crowd_member_id"], name: "index_eventual_event_participants_on_crowd_member_id"
    t.index ["event_crowd_id"], name: "index_eventual_event_participants_on_event_crowd_id"
    t.index ["event_id"], name: "index_eventual_event_participants_on_event_id"
    t.index ["participant_type", "participant_id"], name: "index_eventual_event_participants_on_participant"
  end

  create_table "eventual_event_taxons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.index ["organ_id"], name: "index_eventual_event_taxons_on_organ_id"
  end

  create_table "eventual_events", force: :cascade do |t|
    t.bigint "event_taxon_id"
    t.string "name"
    t.string "description", limit: 4096
    t.integer "position"
    t.integer "event_items_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.integer "event_participants_count", default: 0
    t.integer "members_count", default: 0
    t.bigint "time_list_id"
    t.bigint "place_id"
    t.date "begin_on"
    t.date "end_on"
    t.date "produced_begin_on"
    t.date "produced_end_on"
    t.boolean "produce_done"
    t.string "repeat_type"
    t.integer "repeat_count", comment: "每几周/天"
    t.string "repeat_days", array: true
    t.index ["event_taxon_id"], name: "index_eventual_events_on_event_taxon_id"
    t.index ["organ_id"], name: "index_eventual_events_on_organ_id"
    t.index ["place_id"], name: "index_eventual_events_on_place_id"
    t.index ["time_list_id"], name: "index_eventual_events_on_time_list_id"
  end

  create_table "eventual_place_taxon_hierarchies", force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "place_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "place_taxon_desc_idx"
  end

  create_table "eventual_place_taxons", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "parent_id"
    t.string "name"
    t.integer "position"
    t.decimal "profit_margin", precision: 4, scale: 2
    t.jsonb "parent_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "places_count"
    t.index ["organ_id"], name: "index_eventual_place_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_eventual_place_taxons_on_parent_id"
  end

  create_table "eventual_places", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "place_taxon_id"
    t.string "description"
    t.bigint "area_id"
    t.integer "seats_count", default: 0
    t.integer "plans_count", default: 0
    t.jsonb "place_taxon_ancestors"
    t.index ["area_id"], name: "index_eventual_places_on_area_id"
    t.index ["organ_id"], name: "index_eventual_places_on_organ_id"
    t.index ["place_taxon_id"], name: "index_eventual_places_on_place_taxon_id"
  end

  create_table "eventual_plan_attenders", id: :serial, force: :cascade do |t|
    t.integer "plan_item_id"
    t.string "attender_type"
    t.integer "attender_id"
    t.integer "place_id"
    t.boolean "attended"
    t.string "state"
    t.jsonb "extra"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "plan_participant_id"
    t.bigint "plan_id"
    t.index ["attender_type", "attender_id"], name: "index_eventual_plan_attenders_on_attender_type_and_attender_id"
    t.index ["place_id"], name: "index_eventual_plan_attenders_on_place_id"
    t.index ["plan_id"], name: "index_eventual_plan_attenders_on_plan_id"
    t.index ["plan_item_id"], name: "index_eventual_plan_attenders_on_plan_item_id"
    t.index ["plan_participant_id"], name: "index_eventual_plan_attenders_on_plan_participant_id"
  end

  create_table "eventual_plan_items", id: :serial, force: :cascade do |t|
    t.integer "time_item_id"
    t.integer "place_id"
    t.date "plan_on"
    t.string "repeat_index"
    t.integer "bookings_count", default: 0
    t.jsonb "extra"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "time_list_id"
    t.string "planned_type"
    t.bigint "planned_id"
    t.bigint "event_id"
    t.bigint "event_item_id"
    t.integer "plan_participants_count", default: 0
    t.index ["event_id"], name: "index_eventual_plan_items_on_event_id"
    t.index ["event_item_id"], name: "index_eventual_plan_items_on_event_item_id"
    t.index ["place_id"], name: "index_eventual_plan_items_on_place_id"
    t.index ["planned_type", "planned_id"], name: "index_eventual_plan_items_on_planned_type_and_planned_id"
    t.index ["time_item_id"], name: "index_eventual_plan_items_on_time_item_id"
    t.index ["time_list_id"], name: "index_eventual_plan_items_on_time_list_id"
  end

  create_table "eventual_plan_participants", force: :cascade do |t|
    t.string "planning_type"
    t.bigint "planning_id"
    t.bigint "event_participant_id"
    t.string "participant_type"
    t.bigint "participant_id"
    t.string "type"
    t.string "status", comment: "默认 event_participant 有效"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_participant_id"], name: "index_eventual_plan_participants_on_event_participant_id"
    t.index ["participant_type", "participant_id"], name: "index_eventual_plan_participants_on_participant"
    t.index ["planning_type", "planning_id"], name: "index_eventual_plan_participants_on_planning"
  end

  create_table "eventual_plans", id: :serial, force: :cascade do |t|
    t.integer "time_list_id"
    t.string "planned_type"
    t.integer "planned_id"
    t.integer "place_id"
    t.date "begin_on"
    t.date "end_on"
    t.string "repeat_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "repeat_count"
    t.jsonb "repeat_days"
    t.string "title"
    t.date "produced_begin_on"
    t.date "produced_end_on"
    t.boolean "produce_done"
    t.index ["place_id"], name: "index_eventual_plans_on_place_id"
    t.index ["planned_type", "planned_id"], name: "index_eventual_plans_on_planned_type_and_planned_id"
    t.index ["time_list_id"], name: "index_eventual_plans_on_time_list_id"
  end

  create_table "eventual_seats", force: :cascade do |t|
    t.bigint "place_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_members", default: 1
    t.integer "max_members"
    t.index ["place_id"], name: "index_eventual_seats_on_place_id"
  end

  create_table "eventual_time_items", id: :serial, force: :cascade do |t|
    t.integer "time_list_id"
    t.time "start_at"
    t.time "finish_at"
    t.integer "position", default: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["time_list_id"], name: "index_eventual_time_items_on_time_list_id"
  end

  create_table "eventual_time_lists", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "interval_minutes", default: 0
    t.integer "item_minutes", default: 45
    t.boolean "default"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id"
    t.string "kind"
    t.index ["organ_id"], name: "index_eventual_time_lists_on_organ_id"
  end

  create_table "factory_brands", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.string "code"
    t.integer "products_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_brands_on_organ_id"
  end

  create_table "factory_component_parts", force: :cascade do |t|
    t.bigint "component_id"
    t.bigint "part_id"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "taxon_id"
    t.bigint "product_id"
    t.integer "min"
    t.integer "max"
    t.index ["component_id"], name: "index_factory_component_parts_on_component_id"
    t.index ["part_id"], name: "index_factory_component_parts_on_part_id"
    t.index ["product_id"], name: "index_factory_component_parts_on_product_id"
    t.index ["taxon_id"], name: "index_factory_component_parts_on_taxon_id"
  end

  create_table "factory_components", force: :cascade do |t|
    t.bigint "part_taxon_id"
    t.string "name"
    t.integer "min_select", default: 1
    t.integer "max_select", default: 1, comment: "最大同时选择，1则为单选"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "component_parts_count", default: 0
    t.bigint "taxon_id"
    t.bigint "product_id"
    t.string "type"
    t.boolean "multiple"
    t.index ["part_taxon_id"], name: "index_factory_components_on_part_taxon_id"
    t.index ["product_id"], name: "index_factory_components_on_product_id"
    t.index ["taxon_id"], name: "index_factory_components_on_taxon_id"
  end

  create_table "factory_factory_providers", force: :cascade do |t|
    t.bigint "factory_taxon_id"
    t.bigint "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factory_taxon_id"], name: "index_factory_factory_providers_on_factory_taxon_id"
    t.index ["provider_id"], name: "index_factory_factory_providers_on_provider_id"
  end

  create_table "factory_factory_taxons", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "scene_id"
    t.integer "factory_providers_count"
    t.index ["scene_id"], name: "index_factory_factory_taxons_on_scene_id"
  end

  create_table "factory_fits", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "production_id"
    t.bigint "part_brand_id"
    t.bigint "part_serial_id"
    t.bigint "part_product_id"
    t.bigint "part_production_id"
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

  create_table "factory_part_items", force: :cascade do |t|
    t.bigint "part_id"
    t.bigint "product_item_id"
    t.string "qr_code"
    t.string "state"
    t.datetime "received_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["part_id"], name: "index_factory_part_items_on_part_id"
    t.index ["product_item_id"], name: "index_factory_part_items_on_product_item_id"
  end

  create_table "factory_part_plans", force: :cascade do |t|
    t.bigint "part_id"
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.string "state"
    t.integer "purchased_count", default: 0
    t.integer "received_count", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "product_id"
    t.bigint "production_id"
    t.index ["part_id"], name: "index_factory_part_plans_on_part_id"
    t.index ["product_id"], name: "index_factory_part_plans_on_product_id"
    t.index ["production_id"], name: "index_factory_part_plans_on_production_id"
  end

  create_table "factory_part_providers", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "production_id"
    t.bigint "provider_id"
    t.bigint "organ_id"
    t.boolean "verified"
    t.boolean "selected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "upstream_product_id"
    t.bigint "upstream_production_id"
    t.decimal "cost_price"
    t.index ["organ_id"], name: "index_factory_part_providers_on_organ_id"
    t.index ["product_id"], name: "index_factory_part_providers_on_product_id"
    t.index ["production_id"], name: "index_factory_part_providers_on_production_id"
    t.index ["provider_id"], name: "index_factory_part_providers_on_provider_id"
    t.index ["upstream_product_id"], name: "index_factory_part_providers_on_upstream_product_id"
    t.index ["upstream_production_id"], name: "index_factory_part_providers_on_upstream_production_id"
  end

  create_table "factory_part_taxon_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "part_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "part_taxon_desc_idx"
  end

  create_table "factory_part_taxons", force: :cascade do |t|
    t.string "name"
    t.integer "position", default: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id"
    t.boolean "take_stock", comment: "可盘点"
    t.bigint "factory_taxon_id"
    t.integer "parts_count", default: 0
    t.index ["factory_taxon_id"], name: "index_factory_part_taxons_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_part_taxons_on_organ_id"
  end

  create_table "factory_parts", force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "factory_produce_plans", force: :cascade do |t|
    t.string "title"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.bigint "scene_id"
    t.date "produce_on"
    t.integer "serial_number"
    t.datetime "book_finish_at"
    t.datetime "book_start_at"
    t.integer "production_plans_count", default: 0
    t.index ["organ_id"], name: "index_factory_produce_plans_on_organ_id"
    t.index ["scene_id"], name: "index_factory_produce_plans_on_scene_id"
  end

  create_table "factory_produces", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "content"
  end

  create_table "factory_product_hosts", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "product_id"
    t.decimal "profit_margin", default: "0.0"
    t.decimal "min_price"
    t.decimal "max_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_product_hosts_on_organ_id"
    t.index ["product_id"], name: "index_factory_product_hosts_on_product_id"
  end

  create_table "factory_product_plans", force: :cascade do |t|
    t.bigint "product_id"
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.string "state"
    t.integer "planned_count", default: 0
    t.integer "produced_count", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "produce_plan_id"
    t.index ["produce_plan_id"], name: "index_factory_product_plans_on_produce_plan_id"
    t.index ["product_id"], name: "index_factory_product_plans_on_product_id"
  end

  create_table "factory_product_produces", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "produce_id"
    t.integer "position"
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produce_id"], name: "index_factory_product_produces_on_produce_id"
    t.index ["product_id"], name: "index_factory_product_produces_on_product_id"
  end

  create_table "factory_product_provides", force: :cascade do |t|
    t.bigint "provide_id"
    t.bigint "product_id"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_factory_product_provides_on_product_id"
    t.index ["provide_id"], name: "index_factory_product_provides_on_provide_id"
  end

  create_table "factory_product_taxon_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "product_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "product_taxon_desc_idx"
  end

  create_table "factory_production_carts", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "user_id"
    t.bigint "product_id"
    t.bigint "production_id"
    t.string "state", default: "init"
    t.datetime "customized_at", precision: nil
    t.decimal "original_price", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_factory_production_carts_on_cart_id"
    t.index ["product_id"], name: "index_factory_production_carts_on_product_id"
    t.index ["production_id"], name: "index_factory_production_carts_on_production_id"
    t.index ["user_id"], name: "index_factory_production_carts_on_user_id"
  end

  create_table "factory_production_items", force: :cascade do |t|
    t.bigint "production_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_item_id"
    t.datetime "came_at"
    t.string "code"
    t.bigint "grid_id"
    t.bigint "room_id"
    t.bigint "building_id"
    t.bigint "station_id"
    t.decimal "amount"
    t.index ["building_id"], name: "index_factory_production_items_on_building_id"
    t.index ["grid_id"], name: "index_factory_production_items_on_grid_id"
    t.index ["product_item_id"], name: "index_factory_production_items_on_product_item_id"
    t.index ["production_id"], name: "index_factory_production_items_on_production_id"
    t.index ["room_id"], name: "index_factory_production_items_on_room_id"
    t.index ["station_id"], name: "index_factory_production_items_on_station_id"
  end

  create_table "factory_production_parts", force: :cascade do |t|
    t.bigint "production_id"
    t.bigint "part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.bigint "part_taxon_id"
    t.integer "number"
    t.bigint "component_id"
    t.index ["component_id"], name: "index_factory_production_parts_on_component_id"
    t.index ["part_id"], name: "index_factory_production_parts_on_part_id"
    t.index ["part_taxon_id"], name: "index_factory_production_parts_on_part_taxon_id"
    t.index ["product_id"], name: "index_factory_production_parts_on_product_id"
    t.index ["production_id"], name: "index_factory_production_parts_on_production_id"
  end

  create_table "factory_production_plans", force: :cascade do |t|
    t.bigint "production_id"
    t.bigint "product_id"
    t.bigint "scene_id"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string "state"
    t.integer "planned_count", default: 0
    t.integer "production_items_count", default: 0
    t.date "produce_on"
    t.boolean "specialty", default: false, comment: "主推"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trade_items_count", default: 0
    t.bigint "organ_id"
    t.bigint "station_id"
    t.index ["organ_id"], name: "index_factory_production_plans_on_organ_id"
    t.index ["product_id"], name: "index_factory_production_plans_on_product_id"
    t.index ["production_id"], name: "index_factory_production_plans_on_production_id"
    t.index ["scene_id"], name: "index_factory_production_plans_on_scene_id"
    t.index ["station_id"], name: "index_factory_production_plans_on_station_id"
  end

  create_table "factory_production_provides", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "production_id"
    t.bigint "upstream_product_id"
    t.bigint "upstream_production_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "taxon_id"
    t.bigint "provide_id"
    t.decimal "cost_price"
    t.boolean "default"
    t.string "provide_config_type"
    t.bigint "provide_config_id"
    t.index ["product_id"], name: "index_factory_production_provides_on_product_id"
    t.index ["production_id"], name: "index_factory_production_provides_on_production_id"
    t.index ["provide_config_type", "provide_config_id"], name: "index_factory_production_provides_on_provide_config"
    t.index ["provide_id"], name: "index_factory_production_provides_on_provide_id"
    t.index ["taxon_id"], name: "index_factory_production_provides_on_taxon_id"
    t.index ["upstream_product_id"], name: "index_factory_production_provides_on_upstream_product_id"
    t.index ["upstream_production_id"], name: "index_factory_production_provides_on_upstream_production_id"
  end

  create_table "factory_production_spaces", force: :cascade do |t|
    t.bigint "production_id"
    t.bigint "grid_id"
    t.bigint "room_id"
    t.bigint "desk_id"
    t.bigint "building_id"
    t.bigint "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_factory_production_spaces_on_building_id"
    t.index ["desk_id"], name: "index_factory_production_spaces_on_desk_id"
    t.index ["grid_id"], name: "index_factory_production_spaces_on_grid_id"
    t.index ["production_id"], name: "index_factory_production_spaces_on_production_id"
    t.index ["room_id"], name: "index_factory_production_spaces_on_room_id"
    t.index ["station_id"], name: "index_factory_production_spaces_on_station_id"
  end

  create_table "factory_productions", force: :cascade do |t|
    t.bigint "product_id"
    t.string "name"
    t.string "qr_code"
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.decimal "cost_price", default: "0.0"
    t.decimal "profit_price", default: "0.0"
    t.string "str_part_ids"
    t.boolean "default"
    t.string "state"
    t.string "sku"
    t.decimal "advance_price", default: "0.0"
    t.jsonb "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled", default: false
    t.bigint "taxon_id"
    t.bigint "organ_id"
    t.boolean "automatic", default: false
    t.string "good_type"
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.bigint "product_host_id"
    t.bigint "factory_taxon_id"
    t.integer "position"
    t.integer "rent_charges_count"
    t.string "rent_unit"
    t.boolean "presell"
    t.string "link"
    t.decimal "stock"
    t.jsonb "last_stock_log"
    t.decimal "step", comment: "Item Number Step"
    t.string "word", comment: "搜索关键词"
    t.index ["factory_taxon_id"], name: "index_factory_productions_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_productions_on_organ_id"
    t.index ["product_host_id"], name: "index_factory_productions_on_product_host_id"
    t.index ["product_id"], name: "index_factory_productions_on_product_id"
    t.index ["taxon_id"], name: "index_factory_productions_on_taxon_id"
  end

  create_table "factory_products", force: :cascade do |t|
    t.bigint "taxon_id"
    t.string "name"
    t.string "description"
    t.string "qr_prefix"
    t.string "sku"
    t.integer "order_items_count", default: 0
    t.boolean "published", default: true
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id"
    t.integer "productions_count", default: 0
    t.integer "product_parts_count", default: 0
    t.bigint "unifier_id"
    t.bigint "brand_id"
    t.boolean "specialty", default: false
    t.integer "fits_count", default: 0
    t.jsonb "taxon_ancestors"
    t.bigint "factory_taxon_id"
    t.integer "position"
    t.decimal "base_price"
    t.decimal "profit_margin"
    t.decimal "min_price"
    t.decimal "max_price"
    t.index ["brand_id"], name: "index_factory_products_on_brand_id"
    t.index ["factory_taxon_id"], name: "index_factory_products_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_products_on_organ_id"
    t.index ["sku"], name: "index_factory_products_on_sku"
    t.index ["taxon_id"], name: "index_factory_products_on_taxon_id"
    t.index ["unifier_id"], name: "index_factory_products_on_unifier_id"
  end

  create_table "factory_provides", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "invite_token"
    t.bigint "factory_provider_id"
    t.index ["factory_provider_id"], name: "index_factory_provides_on_factory_provider_id"
    t.index ["organ_id"], name: "index_factory_provides_on_organ_id"
    t.index ["provider_id"], name: "index_factory_provides_on_provider_id"
  end

  create_table "factory_scene_automatics", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "scene_id"
    t.integer "advance_days", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_scene_automatics_on_organ_id"
    t.index ["scene_id"], name: "index_factory_scene_automatics_on_scene_id"
  end

  create_table "factory_scenes", force: :cascade do |t|
    t.string "title"
    t.integer "book_start_days", default: 1
    t.time "book_start_at"
    t.integer "book_finish_days", default: 0
    t.time "book_finish_at"
    t.time "deliver_start_at"
    t.time "deliver_finish_at"
    t.boolean "specialty", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.index ["organ_id"], name: "index_factory_scenes_on_organ_id"
  end

  create_table "factory_serial_hierarchies", force: :cascade do |t|
    t.bigint "ancestor_id"
    t.bigint "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "factory/serial_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_factory_serial_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_factory_serial_hierarchies_on_descendant_id"
  end

  create_table "factory_serials", force: :cascade do |t|
    t.bigint "brand_id"
    t.bigint "parent_id"
    t.string "name"
    t.integer "position"
    t.integer "products_count", default: 0
    t.jsonb "parent_ancestors", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_factory_serials_on_brand_id"
    t.index ["parent_id"], name: "index_factory_serials_on_parent_id"
  end

  create_table "factory_stock_logs", force: :cascade do |t|
    t.bigint "production_id"
    t.string "source_type"
    t.bigint "source_id"
    t.string "title"
    t.string "tag_str"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "stock"
    t.index ["production_id"], name: "index_factory_stock_logs_on_production_id"
    t.index ["source_type", "source_id"], name: "index_factory_stock_logs_on_source"
  end

  create_table "factory_taxon_hierarchies", force: :cascade do |t|
    t.bigint "ancestor_id"
    t.bigint "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "factory/taxon_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_factory_taxon_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_factory_taxon_hierarchies_on_descendant_id"
  end

  create_table "factory_taxon_provides", force: :cascade do |t|
    t.bigint "provide_id"
    t.bigint "taxon_id"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provide_id"], name: "index_factory_taxon_provides_on_provide_id"
    t.index ["taxon_id"], name: "index_factory_taxon_provides_on_taxon_id"
  end

  create_table "factory_taxons", force: :cascade do |t|
    t.string "name"
    t.integer "position", default: 1
    t.bigint "parent_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id"
    t.json "parent_ancestors"
    t.bigint "factory_taxon_id"
    t.integer "products_count", default: 0
    t.boolean "enabled", default: true
    t.bigint "scene_id"
    t.boolean "take_stock", comment: "可盘点"
    t.integer "provides_count"
    t.boolean "nav", comment: "单独分类"
    t.integer "taxon_components_count"
    t.index ["factory_taxon_id"], name: "index_factory_taxons_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_factory_taxons_on_parent_id"
    t.index ["scene_id"], name: "index_factory_taxons_on_scene_id"
  end

  create_table "factory_unifiers", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finance_assessments", force: :cascade do |t|
    t.bigint "organ_id"
    t.decimal "amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "trustee_amount"
    t.index ["organ_id"], name: "index_finance_assessments_on_organ_id"
  end

  create_table "finance_budgets", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "member_id"
    t.string "financial_type"
    t.bigint "financial_id"
    t.bigint "financial_taxon_id"
    t.string "state", default: "init"
    t.string "subject"
    t.decimal "amount"
    t.string "note", limit: 4096
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id"
    t.string "type"
    t.bigint "fund_id"
    t.bigint "stock_id"
    t.index ["financial_taxon_id"], name: "index_finance_budgets_on_financial_taxon_id"
    t.index ["financial_type", "financial_id"], name: "index_budgets_on_budgeting"
    t.index ["fund_id"], name: "index_finance_budgets_on_fund_id"
    t.index ["member_id"], name: "index_finance_budgets_on_member_id"
    t.index ["organ_id"], name: "index_finance_budgets_on_organ_id"
    t.index ["stock_id"], name: "index_finance_budgets_on_stock_id"
    t.index ["task_id"], name: "index_finance_budgets_on_task_id"
  end

  create_table "finance_expense_items", force: :cascade do |t|
    t.bigint "expense_id"
    t.bigint "financial_taxon_id"
    t.decimal "amount", precision: 10, scale: 2
    t.string "note"
    t.string "state"
    t.integer "quantity", default: 1
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "budget_id"
    t.decimal "budget_amount"
    t.index ["budget_id"], name: "index_finance_expense_items_on_budget_id"
    t.index ["expense_id"], name: "index_finance_expense_items_on_expense_id"
    t.index ["financial_taxon_id"], name: "index_finance_expense_items_on_financial_taxon_id"
  end

  create_table "finance_expense_members", force: :cascade do |t|
    t.bigint "expense_id"
    t.bigint "member_id"
    t.bigint "payment_method_id"
    t.decimal "amount", precision: 10, scale: 2
    t.boolean "advance"
    t.string "state", default: "pending"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "operator_id"
    t.string "payable_type"
    t.bigint "payable_id"
    t.string "type"
    t.string "payout_uuid"
    t.decimal "requested_amount"
    t.decimal "actual_amount"
    t.datetime "paid_at", precision: nil
    t.string "account_bank"
    t.string "account_name"
    t.string "account_num"
    t.bigint "wallet_id"
    t.index ["expense_id"], name: "index_finance_expense_members_on_expense_id"
    t.index ["member_id"], name: "index_finance_expense_members_on_member_id"
    t.index ["operator_id"], name: "index_finance_expense_members_on_operator_id"
    t.index ["payable_type", "payable_id"], name: "index_finance_expense_members_on_payable"
    t.index ["payment_method_id"], name: "index_finance_expense_members_on_payment_method_id"
    t.index ["wallet_id"], name: "index_finance_expense_members_on_wallet_id"
  end

  create_table "finance_expenses", force: :cascade do |t|
    t.bigint "payout_id"
    t.bigint "creator_id"
    t.bigint "financial_taxon_id"
    t.bigint "payment_method_id"
    t.string "type"
    t.string "state", default: "init"
    t.string "subject"
    t.decimal "amount", precision: 10, scale: 2
    t.string "note", limit: 4096
    t.integer "invoices_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.bigint "budget_id"
    t.string "financial_type"
    t.bigint "financial_id"
    t.bigint "fund_id"
    t.bigint "stock_id"
    t.index ["budget_id"], name: "index_finance_expenses_on_budget_id"
    t.index ["creator_id"], name: "index_finance_expenses_on_creator_id"
    t.index ["financial_taxon_id"], name: "index_finance_expenses_on_financial_taxon_id"
    t.index ["financial_type", "financial_id"], name: "index_expenses_on_financial"
    t.index ["fund_id"], name: "index_finance_expenses_on_fund_id"
    t.index ["organ_id"], name: "index_finance_expenses_on_organ_id"
    t.index ["payment_method_id"], name: "index_finance_expenses_on_payment_method_id"
    t.index ["payout_id"], name: "index_finance_expenses_on_payout_id"
    t.index ["stock_id"], name: "index_finance_expenses_on_stock_id"
  end

  create_table "finance_financial_taxon_hierarchies", force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "financial_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "financial_taxon_desc_idx"
  end

  create_table "finance_financial_taxons", force: :cascade do |t|
    t.bigint "parent_id"
    t.jsonb "parent_ancestors"
    t.string "name"
    t.integer "position"
    t.boolean "take_stock", comment: "是否有库存"
    t.boolean "individual", comment: "是否可盘点"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.index ["organ_id"], name: "index_finance_financial_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_finance_financial_taxons_on_parent_id"
  end

  create_table "finance_fund_incomes", force: :cascade do |t|
    t.bigint "fund_id"
    t.bigint "user_id"
    t.string "financial_type"
    t.bigint "financial_id"
    t.boolean "visible"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.string "state", default: "init"
    t.index ["financial_type", "financial_id"], name: "index_fund_incomes_on_financial"
    t.index ["fund_id"], name: "index_finance_fund_incomes_on_fund_id"
    t.index ["user_id"], name: "index_finance_fund_incomes_on_user_id"
  end

  create_table "finance_funds", force: :cascade do |t|
    t.string "name"
    t.decimal "budget_amount"
    t.decimal "amount", default: "0.0"
    t.string "note"
    t.string "sku"
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "budget_detail", default: {}
    t.decimal "expense_amount", default: "0.0"
    t.jsonb "expense_detail", default: {}
    t.bigint "organ_id"
    t.string "good_type"
    t.bigint "user_id"
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.decimal "step", comment: "Item Number Step"
    t.index ["organ_id"], name: "index_finance_funds_on_organ_id"
    t.index ["user_id"], name: "index_finance_funds_on_user_id"
  end

  create_table "finance_stocks", force: :cascade do |t|
    t.bigint "assessment_id"
    t.decimal "ratio", precision: 4, scale: 2
    t.integer "amount", default: 0, comment: "发行量"
    t.integer "expense_amount", default: 0
    t.jsonb "expense_detail", default: {}
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "assess_amount"
    t.bigint "member_id"
    t.bigint "organ_id"
    t.index ["assessment_id"], name: "index_finance_stocks_on_assessment_id"
    t.index ["member_id"], name: "index_finance_stocks_on_member_id"
    t.index ["organ_id"], name: "index_finance_stocks_on_organ_id"
  end

  create_table "finance_taxon_hierarchies", force: :cascade do |t|
    t.bigint "ancestor_id"
    t.bigint "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "finance/taxon_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_finance_taxon_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_finance_taxon_hierarchies_on_descendant_id"
  end

  create_table "finance_taxons", force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "organ_id"
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

  create_table "good_job_batches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.jsonb "serialized_properties"
    t.text "on_finish"
    t.text "on_success"
    t.text "on_discard"
    t.text "callback_queue_name"
    t.integer "callback_priority"
    t.datetime "enqueued_at"
    t.datetime "discarded_at"
    t.datetime "finished_at"
  end

  create_table "good_job_executions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "active_job_id", null: false
    t.text "job_class"
    t.text "queue_name"
    t.jsonb "serialized_params"
    t.datetime "scheduled_at"
    t.datetime "finished_at"
    t.text "error"
    t.integer "error_event", limit: 2
    t.index ["active_job_id", "created_at"], name: "index_good_job_executions_on_active_job_id_and_created_at"
  end

  create_table "good_job_processes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "state"
  end

  create_table "good_job_settings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "key"
    t.jsonb "value"
    t.index ["key"], name: "index_good_job_settings_on_key", unique: true
  end

  create_table "good_jobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "queue_name"
    t.integer "priority"
    t.jsonb "serialized_params"
    t.datetime "scheduled_at", precision: nil
    t.datetime "performed_at", precision: nil
    t.datetime "finished_at", precision: nil
    t.text "error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "active_job_id"
    t.text "concurrency_key"
    t.text "cron_key"
    t.uuid "retried_good_job_id"
    t.datetime "cron_at", precision: nil
    t.uuid "batch_id"
    t.uuid "batch_callback_id"
    t.boolean "is_discrete"
    t.integer "executions_count"
    t.text "job_class"
    t.integer "error_event", limit: 2
    t.index ["active_job_id", "created_at"], name: "index_good_jobs_on_active_job_id_and_created_at"
    t.index ["active_job_id"], name: "index_good_jobs_on_active_job_id"
    t.index ["batch_callback_id"], name: "index_good_jobs_on_batch_callback_id", where: "(batch_callback_id IS NOT NULL)"
    t.index ["batch_id"], name: "index_good_jobs_on_batch_id", where: "(batch_id IS NOT NULL)"
    t.index ["concurrency_key"], name: "index_good_jobs_on_concurrency_key_when_unfinished", where: "(finished_at IS NULL)"
    t.index ["cron_key", "created_at"], name: "index_good_jobs_on_cron_key_and_created_at"
    t.index ["cron_key", "cron_at"], name: "index_good_jobs_on_cron_key_and_cron_at", unique: true
    t.index ["finished_at"], name: "index_good_jobs_jobs_on_finished_at", where: "((retried_good_job_id IS NULL) AND (finished_at IS NOT NULL))"
    t.index ["priority", "created_at"], name: "index_good_jobs_jobs_on_priority_created_at_when_unfinished", order: { priority: "DESC NULLS LAST" }, where: "(finished_at IS NULL)"
    t.index ["queue_name", "scheduled_at"], name: "index_good_jobs_on_queue_name_and_scheduled_at", where: "(finished_at IS NULL)"
    t.index ["scheduled_at"], name: "index_good_jobs_on_scheduled_at", where: "(finished_at IS NULL)"
  end

  create_table "growth_aim_codes", force: :cascade do |t|
    t.bigint "aim_id"
    t.string "controller_path"
    t.string "action_name"
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aim_id"], name: "index_growth_aim_codes_on_aim_id"
  end

  create_table "growth_aim_entities", force: :cascade do |t|
    t.bigint "aim_id"
    t.bigint "user_id"
    t.string "entity_type"
    t.bigint "entity_id"
    t.bigint "reward_expense_id"
    t.integer "present_point"
    t.string "state"
    t.datetime "last_access_at", precision: nil
    t.string "ip"
    t.decimal "reward_amount", precision: 10, scale: 2
    t.integer "aim_logs_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text_year"
    t.string "text_month"
    t.string "text_week"
    t.string "text_date"
    t.index ["aim_id"], name: "index_growth_aim_entities_on_aim_id"
    t.index ["entity_type", "entity_id"], name: "index_growth_aim_entities_on_entity_type_and_entity_id"
    t.index ["reward_expense_id"], name: "index_growth_aim_entities_on_reward_expense_id"
    t.index ["user_id"], name: "index_growth_aim_entities_on_user_id"
  end

  create_table "growth_aim_logs", force: :cascade do |t|
    t.bigint "aim_id"
    t.bigint "user_id"
    t.string "entity_type"
    t.bigint "entity_id"
    t.string "serial_number"
    t.string "ip"
    t.string "code"
    t.boolean "rewarded"
    t.datetime "created_at", precision: nil, null: false
    t.index ["aim_id"], name: "index_growth_aim_logs_on_aim_id"
    t.index ["entity_type", "entity_id"], name: "index_growth_aim_logs_on_entity_type_and_entity_id"
    t.index ["user_id"], name: "index_growth_aim_logs_on_user_id"
  end

  create_table "growth_aim_users", force: :cascade do |t|
    t.bigint "aim_id"
    t.bigint "user_id"
    t.string "state", default: "task_doing"
    t.integer "reward_amount", default: 0
    t.integer "aim_entities_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text_year"
    t.string "text_month"
    t.string "text_week"
    t.string "text_date"
    t.index ["aim_id"], name: "index_growth_aim_users_on_aim_id"
    t.index ["user_id"], name: "index_growth_aim_users_on_user_id"
  end

  create_table "growth_aims", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.string "repeat_type"
    t.decimal "rate", precision: 10, scale: 2, default: "1.0"
    t.integer "task_point", default: 0
    t.integer "reward_point", default: 0
    t.integer "reward_amount", default: 0
    t.boolean "verbose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "growth_praise_incomes", force: :cascade do |t|
    t.bigint "reward_id"
    t.bigint "user_id"
    t.bigint "earner_id"
    t.string "source_type"
    t.bigint "source_id"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", comment: "用户打赏"
    t.decimal "profit_amount", precision: 10, scale: 2, default: "0.0", comment: "平台收入"
    t.decimal "royalty_amount", precision: 10, scale: 2, default: "0.0", comment: "作者分成"
    t.decimal "reward_amount", precision: 10, scale: 2, default: "0.0", comment: "赏金池"
    t.string "state", default: "init"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["earner_id"], name: "index_growth_praise_incomes_on_earner_id"
    t.index ["reward_id"], name: "index_growth_praise_incomes_on_reward_id"
    t.index ["source_type", "source_id"], name: "index_growth_praise_incomes_on_source_type_and_source_id"
    t.index ["user_id"], name: "index_growth_praise_incomes_on_user_id"
  end

  create_table "growth_praise_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "reward_id"
    t.string "entity_type"
    t.bigint "entity_id"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_growth_praise_users_on_entity_type_and_entity_id"
    t.index ["reward_id"], name: "index_growth_praise_users_on_reward_id"
    t.index ["user_id"], name: "index_growth_praise_users_on_user_id"
  end

  create_table "growth_reward_expenses", force: :cascade do |t|
    t.bigint "reward_id"
    t.bigint "user_id"
    t.bigint "aim_id"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aim_id"], name: "index_growth_reward_expenses_on_aim_id"
    t.index ["reward_id"], name: "index_growth_reward_expenses_on_reward_id"
    t.index ["user_id"], name: "index_growth_reward_expenses_on_user_id"
  end

  create_table "growth_reward_incomes", force: :cascade do |t|
    t.bigint "reward_id"
    t.bigint "user_id"
    t.decimal "reward_amount", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reward_id"], name: "index_growth_reward_incomes_on_reward_id"
    t.index ["user_id"], name: "index_growth_reward_incomes_on_user_id"
  end

  create_table "growth_rewards", force: :cascade do |t|
    t.string "entity_type"
    t.bigint "entity_id"
    t.decimal "min_piece", precision: 10, scale: 2, default: "1.0"
    t.decimal "max_piece", precision: 10, scale: 2, default: "10.0"
    t.decimal "amount", precision: 10, scale: 2
    t.decimal "income_amount", precision: 10, scale: 2
    t.decimal "expense_amount", precision: 10, scale: 2
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.boolean "enabled", default: true
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_growth_rewards_on_entity_type_and_entity_id"
  end

  create_table "interact_abuses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "abusement_type"
    t.bigint "abusement_id"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abusement_type", "abusement_id"], name: "index_interact_abuses_on_abusement_type_and_abusement_id"
    t.index ["user_id"], name: "index_interact_abuses_on_user_id"
  end

  create_table "interact_attitudes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "attitudinal_type"
    t.bigint "attitudinal_id"
    t.string "opinion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attitudinal_type", "attitudinal_id"], name: "index_interact_attitudes_on_attitudinal_type_and_attitudinal_id"
    t.index ["user_id"], name: "index_interact_attitudes_on_user_id"
  end

  create_table "interact_comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "parent_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.string "title"
    t.string "content"
    t.string "state"
    t.float "score", default: 0.0
    t.integer "liked_count", default: 0
    t.integer "star_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_interact_comments_on_commentable_type_and_commentable_id"
    t.index ["parent_id"], name: "index_interact_comments_on_parent_id"
    t.index ["user_id"], name: "index_interact_comments_on_user_id"
  end

  create_table "interact_stars", force: :cascade do |t|
    t.string "starred_type"
    t.bigint "starred_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["starred_type", "starred_id"], name: "index_interact_stars_on_starred_type_and_starred_id"
    t.index ["user_id"], name: "index_interact_stars_on_user_id"
  end

  create_table "jia_bo_apps", force: :cascade do |t|
    t.string "member_code"
    t.string "api_key"
    t.integer "devices_count", default: 0
    t.integer "templates_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "jia_bo_device_organs", force: :cascade do |t|
    t.bigint "device_id"
    t.bigint "organ_id"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_jia_bo_device_organs_on_device_id"
    t.index ["organ_id"], name: "index_jia_bo_device_organs_on_organ_id"
  end

  create_table "jia_bo_devices", force: :cascade do |t|
    t.bigint "app_id"
    t.string "device_id"
    t.string "dev_name"
    t.string "grp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dev_id"
    t.index ["app_id"], name: "index_jia_bo_devices_on_app_id"
  end

  create_table "jia_bo_parameters", force: :cascade do |t|
    t.bigint "template_id"
    t.string "name", comment: "参数名称"
    t.string "code", comment: "参数 code"
    t.string "comment", comment: "评论"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_jia_bo_parameters_on_template_id"
  end

  create_table "jia_bo_templates", force: :cascade do |t|
    t.bigint "app_id"
    t.string "code", comment: "模板编号"
    t.string "type", comment: "模板类型"
    t.string "title", comment: "模板名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumb_url"
    t.index ["app_id"], name: "index_jia_bo_templates_on_app_id"
  end

  create_table "markdown_assets", force: :cascade do |t|
    t.bigint "git_id"
    t.string "name"
    t.string "path"
    t.string "download_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sha"
    t.index ["git_id"], name: "index_markdown_assets_on_git_id"
  end

  create_table "markdown_catalogs", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.string "parent_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "git_id"
    t.integer "position"
    t.boolean "nav", default: false, comment: "是否导航菜单"
    t.bigint "organ_id"
    t.integer "depth"
    t.string "home_path"
    t.index ["git_id"], name: "index_markdown_catalogs_on_git_id"
    t.index ["organ_id"], name: "index_markdown_catalogs_on_organ_id"
  end

  create_table "markdown_gits", force: :cascade do |t|
    t.string "working_directory"
    t.string "remote_url"
    t.string "last_commit_message"
    t.datetime "last_commit_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.string "type"
    t.string "identity"
    t.string "secret"
    t.string "base_name"
    t.index ["organ_id"], name: "index_markdown_gits_on_organ_id"
  end

  create_table "markdown_posts", force: :cascade do |t|
    t.string "markdown"
    t.string "html"
    t.string "layout"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "git_id"
    t.string "oid"
    t.string "title"
    t.boolean "published", default: true
    t.string "catalog_path", default: ""
    t.boolean "ppt", default: false
    t.boolean "nav", default: false, comment: "是否导航菜单"
    t.bigint "organ_id"
    t.datetime "last_commit_at"
    t.string "slug"
    t.string "target"
    t.boolean "shared"
    t.index ["git_id"], name: "index_markdown_posts_on_git_id"
    t.index ["organ_id"], name: "index_markdown_posts_on_organ_id"
  end

  create_table "notice_announcement_departments", force: :cascade do |t|
    t.bigint "announcement_id"
    t.bigint "department_id"
    t.bigint "organ_id"
    t.integer "notifications_count"
    t.string "state"
    t.datetime "announce_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_notice_announcement_departments_on_announcement_id"
    t.index ["department_id"], name: "index_notice_announcement_departments_on_department_id"
    t.index ["organ_id"], name: "index_notice_announcement_departments_on_organ_id"
  end

  create_table "notice_announcement_job_titles", force: :cascade do |t|
    t.bigint "announcement_id"
    t.bigint "job_title_id"
    t.bigint "department_id"
    t.bigint "organ_id"
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

  create_table "notice_announcement_organs", force: :cascade do |t|
    t.bigint "announcement_id"
    t.bigint "organ_id"
    t.integer "notifications_count"
    t.string "state"
    t.datetime "announce_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_notice_announcement_organs_on_announcement_id"
    t.index ["organ_id"], name: "index_notice_announcement_organs_on_organ_id"
  end

  create_table "notice_announcement_user_tags", force: :cascade do |t|
    t.bigint "announcement_id"
    t.bigint "user_tag_id"
    t.integer "notifications_count"
    t.string "state"
    t.datetime "announce_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_notice_announcement_user_tags_on_announcement_id"
    t.index ["user_tag_id"], name: "index_notice_announcement_user_tags_on_user_tag_id"
  end

  create_table "notice_announcements", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "publisher_type"
    t.bigint "publisher_id"
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

  create_table "notice_annunciations", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "publisher_type"
    t.bigint "publisher_id"
    t.string "title"
    t.string "body"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "notifications_count"
    t.integer "readed_count"
    t.string "type"
    t.index ["organ_id"], name: "index_notice_annunciations_on_organ_id"
    t.index ["publisher_type", "publisher_id"], name: "index_notice_annunciations_on_publisher_type_and_publisher_id"
  end

  create_table "notice_member_annunciates", force: :cascade do |t|
    t.bigint "annunciation_id"
    t.bigint "job_title_id"
    t.bigint "department_id"
    t.integer "notifications_count", default: 0
    t.string "state"
    t.datetime "annunciated_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annunciation_id"], name: "index_notice_member_annunciates_on_annunciation_id"
    t.index ["department_id"], name: "index_notice_member_annunciates_on_department_id"
    t.index ["job_title_id"], name: "index_notice_member_annunciates_on_job_title_id"
  end

  create_table "notice_notification_sendings", force: :cascade do |t|
    t.string "way"
    t.string "sent_to"
    t.datetime "sent_at", precision: nil
    t.string "sent_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "notification_id"
    t.index ["notification_id"], name: "index_notice_notification_sendings_on_notification_id"
  end

  create_table "notice_notifications", id: :serial, force: :cascade do |t|
    t.string "notifiable_type"
    t.integer "notifiable_id"
    t.string "code"
    t.string "state", default: "0"
    t.string "title"
    t.string "body", limit: 5000
    t.string "link"
    t.datetime "sending_at", precision: nil
    t.datetime "read_at", precision: nil
    t.boolean "verbose", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "archived"
    t.boolean "official"
    t.bigint "organ_id"
    t.string "sender_type"
    t.bigint "sender_id"
    t.string "linked_type"
    t.bigint "linked_id"
    t.string "type"
    t.bigint "receiver_id"
    t.index ["linked_type", "linked_id"], name: "index_notice_notifications_on_linked_type_and_linked_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notice_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["organ_id"], name: "index_notice_notifications_on_organ_id"
    t.index ["read_at"], name: "index_notice_notifications_on_read_at"
    t.index ["sender_type", "sender_id"], name: "index_notice_notifications_on_sender_type_and_sender_id"
  end

  create_table "notice_user_annunciates", force: :cascade do |t|
    t.bigint "annunciation_id"
    t.bigint "user_tag_id"
    t.integer "notifications_count", default: 0
    t.string "state"
    t.datetime "annunciated_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annunciation_id"], name: "index_notice_user_annunciates_on_annunciation_id"
    t.index ["user_tag_id"], name: "index_notice_user_annunciates_on_user_tag_id"
  end

  create_table "one_ai_apps", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.string "appid"
    t.string "secret"
    t.string "base_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["appid"], name: "index_one_ai_apps_on_appid"
    t.index ["organ_id"], name: "index_one_ai_apps_on_organ_id"
  end

  create_table "one_ai_chats", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "one_ai_messages", force: :cascade do |t|
    t.bigint "chat_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["chat_id"], name: "index_one_ai_messages_on_chat_id"
  end

  create_table "org_department_grants", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "organ_handle_id"
    t.bigint "department_id"
    t.bigint "job_title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_org_department_grants_on_department_id"
    t.index ["job_title_id"], name: "index_org_department_grants_on_job_title_id"
    t.index ["organ_handle_id"], name: "index_org_department_grants_on_organ_handle_id"
    t.index ["organ_id"], name: "index_org_department_grants_on_organ_id"
  end

  create_table "org_department_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "department_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "department_desc_idx"
  end

  create_table "org_departments", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "parent_id"
    t.string "name"
    t.integer "member_departments_count", default: 0
    t.integer "needed_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "all_member_departments_count"
    t.bigint "superior_id"
    t.jsonb "superior_ancestors"
    t.jsonb "parent_ancestors"
    t.index ["organ_id"], name: "index_org_departments_on_organ_id"
    t.index ["parent_id"], name: "index_org_departments_on_parent_id"
    t.index ["superior_id"], name: "index_org_departments_on_superior_id"
  end

  create_table "org_job_descriptions", force: :cascade do |t|
    t.bigint "department_id"
    t.text "requirements"
    t.text "advanced_requirements"
    t.string "english_requirement"
    t.string "degree_requirement"
    t.text "duties"
    t.integer "salary_min"
    t.integer "salary_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_org_job_descriptions_on_department_id"
  end

  create_table "org_job_titles", force: :cascade do |t|
    t.bigint "department_id"
    t.bigint "department_root_id"
    t.string "name"
    t.integer "grade"
    t.integer "limit_member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.bigint "super_job_title_id"
    t.integer "super_grade"
    t.index ["department_id"], name: "index_org_job_titles_on_department_id"
    t.index ["department_root_id"], name: "index_org_job_titles_on_department_root_id"
    t.index ["super_job_title_id"], name: "index_org_job_titles_on_super_job_title_id"
  end

  create_table "org_job_transfers", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "to_office_id"
    t.bigint "to_department_id"
    t.bigint "to_job_title_id"
    t.bigint "from_office_id"
    t.bigint "from_department_id"
    t.bigint "from_job_title_id"
    t.string "state", default: "init"
    t.date "transfer_on"
    t.string "reason_note", limit: 4096
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_department_id"], name: "index_org_job_transfers_on_from_department_id"
    t.index ["from_job_title_id"], name: "index_org_job_transfers_on_from_job_title_id"
    t.index ["from_office_id"], name: "index_org_job_transfers_on_from_office_id"
    t.index ["member_id"], name: "index_org_job_transfers_on_member_id"
    t.index ["to_department_id"], name: "index_org_job_transfers_on_to_department_id"
    t.index ["to_job_title_id"], name: "index_org_job_transfers_on_to_job_title_id"
    t.index ["to_office_id"], name: "index_org_job_transfers_on_to_office_id"
  end

  create_table "org_member_departments", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "job_title_id"
    t.bigint "department_root_id"
    t.bigint "department_id"
    t.integer "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "department_ancestors"
    t.bigint "superior_id"
    t.index ["department_id"], name: "index_org_member_departments_on_department_id"
    t.index ["department_root_id"], name: "index_org_member_departments_on_department_root_id"
    t.index ["job_title_id"], name: "index_org_member_departments_on_job_title_id"
    t.index ["member_id"], name: "index_org_member_departments_on_member_id"
    t.index ["superior_id"], name: "index_org_member_departments_on_superior_id"
  end

  create_table "org_members", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.string "identity"
    t.string "number"
    t.date "join_on"
    t.boolean "enabled", default: true
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pomodoro"
    t.bigint "organ_root_id"
    t.jsonb "department_ancestors"
    t.string "experience"
    t.string "attendance_number"
    t.string "notifiable_types", default: [], array: true
    t.jsonb "counters", default: {}
    t.integer "showtime", default: 0
    t.boolean "accept_email", default: true
    t.boolean "inviter", default: false
    t.integer "promote_goods_count", default: 0
    t.string "corp_userid"
    t.string "wechat_openid"
    t.integer "maintains_count"
    t.bigint "member_inviter_id"
    t.bigint "cache_id"
    t.boolean "own"
    t.index ["cache_id"], name: "index_org_members_on_cache_id"
    t.index ["member_inviter_id"], name: "index_org_members_on_member_inviter_id"
    t.index ["organ_id"], name: "index_org_members_on_organ_id"
    t.index ["organ_root_id"], name: "index_org_members_on_organ_root_id"
  end

  create_table "org_organ_domains", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "subdomain"
    t.string "domain", default: "lvh.me"
    t.string "host"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "beian", comment: "备案号"
    t.string "scheme", default: "https"
    t.string "kind"
    t.string "redirect_controller"
    t.string "redirect_action", comment: "默认跳转"
    t.index ["organ_id"], name: "index_org_organ_domains_on_organ_id"
  end

  create_table "org_organ_handles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "record_class"
    t.string "record_column"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "org_organ_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "organ_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "organ_desc_idx"
  end

  create_table "org_organs", force: :cascade do |t|
    t.string "name"
    t.integer "limit_wechat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id"
    t.bigint "parent_id"
    t.string "address"
    t.integer "members_count"
    t.string "name_short"
    t.jsonb "area_ancestors"
    t.integer "limit_wechat_menu", default: 1
    t.jsonb "parent_ancestors"
    t.boolean "official", comment: "是否官方"
    t.boolean "joinable", comment: "是否可搜索并加入"
    t.string "code"
    t.bigint "corp_user_id"
    t.string "service_url", comment: "客服 url"
    t.string "appid"
    t.bigint "creator_id"
    t.bigint "provider_id"
    t.string "license"
    t.boolean "production_enabled"
    t.jsonb "factory_settings"
    t.jsonb "theme_settings", default: {}
    t.string "dispatch"
    t.bigint "cache_id"
    t.index ["area_id"], name: "index_org_organs_on_area_id"
    t.index ["cache_id"], name: "index_org_organs_on_cache_id"
    t.index ["corp_user_id"], name: "index_org_organs_on_corp_user_id"
    t.index ["creator_id"], name: "index_org_organs_on_creator_id"
    t.index ["parent_id"], name: "index_org_organs_on_parent_id"
    t.index ["provider_id"], name: "index_org_organs_on_provider_id"
  end

  create_table "org_resign_reasons", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "resigns_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "org_resign_references", force: :cascade do |t|
    t.bigint "resign_id"
    t.bigint "resign_reason_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resign_id"], name: "index_org_resign_references_on_resign_id"
    t.index ["resign_reason_id"], name: "index_org_resign_references_on_resign_reason_id"
  end

  create_table "org_resigns", force: :cascade do |t|
    t.bigint "member_id"
    t.string "state", default: "init"
    t.date "leave_on"
    t.string "reason_note", limit: 4096
    t.string "handover_note", limit: 4096
    t.string "comment", limit: 4096
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_org_resigns_on_member_id"
  end

  create_table "org_shortcuts", force: :cascade do |t|
    t.bigint "member_id"
    t.string "controller"
    t.string "action"
    t.string "business"
    t.string "namespace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_org_shortcuts_on_member_id"
  end

  create_table "org_super_job_titles", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.string "description"
    t.integer "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_org_super_job_titles_on_organ_id"
  end

  create_table "org_supports", force: :cascade do |t|
    t.bigint "department_id"
    t.bigint "organ_id"
    t.bigint "member_id"
    t.string "name"
    t.integer "grade"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supporter_id"
    t.json "department_ancestors"
    t.index ["department_id"], name: "index_org_supports_on_department_id"
    t.index ["member_id"], name: "index_org_supports_on_member_id"
    t.index ["organ_id"], name: "index_org_supports_on_organ_id"
    t.index ["supporter_id"], name: "index_org_supports_on_supporter_id"
  end

  create_table "org_tutorials", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "tutor_id"
    t.string "kind"
    t.string "state"
    t.string "accepted_status"
    t.string "verified"
    t.date "start_on"
    t.date "finish_on"
    t.string "performance"
    t.integer "allowance"
    t.string "note", limit: 4096
    t.string "comment", limit: 4096
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_org_tutorials_on_member_id"
    t.index ["tutor_id"], name: "index_org_tutorials_on_tutor_id"
  end

  create_table "plan_participants", force: :cascade do |t|
    t.bigint "event_participant_id"
    t.string "participant_type"
    t.bigint "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "planning_type"
    t.bigint "planning_id"
    t.string "type"
    t.string "status", comment: "默认 event_participant 有效"
    t.index ["event_participant_id"], name: "index_plan_participants_on_event_participant_id"
    t.index ["participant_type", "participant_id"], name: "index_plan_participants_on_participant_type_and_participant_id"
    t.index ["planning_type", "planning_id"], name: "index_plan_participants_on_planning_type_and_planning_id"
  end

  create_table "print_devices", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "printer_type"
    t.bigint "printer_id"
    t.string "aim"
    t.boolean "online"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_print_devices_on_organ_id"
    t.index ["printer_type", "printer_id"], name: "index_print_devices_on_printer"
  end

  create_table "print_ip_printers", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "ip"
    t.string "port"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_print_ip_printers_on_organ_id"
  end

  create_table "print_jia_bo_apps", force: :cascade do |t|
    t.string "name"
    t.string "member_code"
    t.string "api_key"
    t.integer "jia_bo_printers_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "print_jia_bo_printers", force: :cascade do |t|
    t.bigint "jia_bo_app_id"
    t.string "device_id"
    t.string "dev_name"
    t.string "grp_id"
    t.string "dev_id"
    t.string "cmd_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.boolean "online"
    t.index ["jia_bo_app_id"], name: "index_print_jia_bo_printers_on_jia_bo_app_id"
    t.index ["organ_id"], name: "index_print_jia_bo_printers_on_organ_id"
  end

  create_table "profiled_address_users", force: :cascade do |t|
    t.bigint "address_id"
    t.bigint "user_id"
    t.bigint "inviter_id"
    t.decimal "commission_ratio", precision: 4, scale: 2, default: "0.0", comment: "佣金比例"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "ordinary"
    t.index ["address_id"], name: "index_profiled_address_users_on_address_id"
    t.index ["inviter_id"], name: "index_profiled_address_users_on_inviter_id"
    t.index ["user_id"], name: "index_profiled_address_users_on_user_id"
  end

  create_table "project_taxon_facilitates", force: :cascade do |t|
    t.bigint "taxon_id"
    t.bigint "facilitate_taxon_id"
    t.bigint "facilitate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_project_taxon_facilitates_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_project_taxon_facilitates_on_facilitate_taxon_id"
    t.index ["taxon_id"], name: "index_project_taxon_facilitates_on_taxon_id"
  end

  create_table "project_taxon_indicators", force: :cascade do |t|
    t.bigint "taxon_id"
    t.bigint "facilitate_taxon_id"
    t.bigint "indicator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_taxon_id"], name: "index_project_taxon_indicators_on_facilitate_taxon_id"
    t.index ["indicator_id"], name: "index_project_taxon_indicators_on_indicator_id"
    t.index ["taxon_id"], name: "index_project_taxon_indicators_on_taxon_id"
  end

  create_table "project_taxons", force: :cascade do |t|
    t.string "name"
    t.string "record_name", default: "ProjectTaxon"
    t.jsonb "parameters", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "fund_budget"
    t.decimal "fund_expense"
    t.decimal "budget_amount"
    t.decimal "expense_amount"
    t.integer "projects_count"
  end

  create_table "qingflow_alias_hierarchies", force: :cascade do |t|
    t.bigint "ancestor_id"
    t.bigint "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "qingflow/alias_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_qingflow_alias_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_qingflow_alias_hierarchies_on_descendant_id"
  end

  create_table "qingflow_aliases", force: :cascade do |t|
    t.bigint "version_id"
    t.string "title"
    t.integer "queid"
    t.integer "que_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.jsonb "parent_ancestors"
    t.datetime "synced_at"
    t.string "full_title"
    t.jsonb "options"
    t.index ["parent_id"], name: "index_qingflow_aliases_on_parent_id"
    t.index ["version_id"], name: "index_qingflow_aliases_on_version_id"
  end

  create_table "qingflow_applications", force: :cascade do |t|
    t.bigint "app_id"
    t.string "name"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.integer "forms_count"
    t.datetime "sync_forms_at"
    t.datetime "sync_items_at"
    t.string "code"
    t.string "qsource"
    t.string "job_id"
    t.string "tag_str"
    t.string "view_key"
    t.index ["app_id"], name: "index_qingflow_applications_on_app_id"
    t.index ["organ_id"], name: "index_qingflow_applications_on_organ_id"
  end

  create_table "qingflow_apps", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.string "appid"
    t.string "secret"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "refresh_token"
    t.datetime "refresh_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.string "base_url"
    t.string "host"
    t.bigint "source_id"
    t.datetime "sync_users_at"
    t.string "client_id"
    t.string "client_secret"
    t.index ["appid"], name: "index_qingflow_apps_on_appid"
    t.index ["organ_id"], name: "index_qingflow_apps_on_organ_id"
    t.index ["source_id"], name: "index_qingflow_apps_on_source_id"
  end

  create_table "qingflow_export_items", force: :cascade do |t|
    t.string "uid"
    t.jsonb "fields"
    t.integer "position"
    t.boolean "header"
    t.string "record_key"
    t.integer "repeat_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "export_user_id"
    t.jsonb "answer_params"
    t.index ["export_user_id"], name: "index_qingflow_export_items_on_export_user_id"
  end

  create_table "qingflow_export_users", force: :cascade do |t|
    t.bigint "export_id"
    t.jsonb "filter"
    t.jsonb "table_filter"
    t.jsonb "import_filter"
    t.string "email"
    t.jsonb "uids"
    t.datetime "uploaded_at"
    t.integer "export_items_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["export_id"], name: "index_qingflow_export_users_on_export_id"
  end

  create_table "qingflow_exports", force: :cascade do |t|
    t.bigint "application_id"
    t.bigint "template_id"
    t.string "name"
    t.jsonb "parameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.jsonb "formats"
    t.jsonb "editable"
    t.index ["application_id"], name: "index_qingflow_exports_on_application_id"
    t.index ["template_id"], name: "index_qingflow_exports_on_template_id"
  end

  create_table "qingflow_files", force: :cascade do |t|
    t.string "url"
    t.string "rule"
    t.jsonb "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "replace"
    t.string "classifier"
  end

  create_table "qingflow_form_hierarchies", force: :cascade do |t|
    t.bigint "ancestor_id"
    t.bigint "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "qingflow/form_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_qingflow_form_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_qingflow_form_hierarchies_on_descendant_id"
  end

  create_table "qingflow_forms", force: :cascade do |t|
    t.bigint "parent_id"
    t.jsonb "parent_ancestors"
    t.string "title"
    t.integer "queid"
    t.integer "que_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "meta_column_id"
    t.boolean "display"
    t.boolean "primary"
    t.boolean "modeling"
    t.string "record_name"
    t.string "foreign_key"
    t.bigint "organ_id"
    t.string "column_name"
    t.boolean "linked"
    t.bigint "group_id"
    t.string "alias_title"
    t.integer "position"
    t.string "record_key"
    t.string "code"
    t.string "full_title"
    t.boolean "required"
    t.datetime "synced_at"
    t.jsonb "options"
    t.index ["group_id"], name: "index_qingflow_forms_on_group_id"
    t.index ["meta_column_id"], name: "index_qingflow_forms_on_meta_column_id"
    t.index ["organ_id"], name: "index_qingflow_forms_on_organ_id"
    t.index ["parent_id"], name: "index_qingflow_forms_on_parent_id"
  end

  create_table "qingflow_group_forms", force: :cascade do |t|
    t.bigint "application_id"
    t.bigint "group_id"
    t.bigint "form_id"
    t.string "queid"
    t.string "title"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_qingflow_group_forms_on_application_id"
    t.index ["form_id"], name: "index_qingflow_group_forms_on_form_id"
    t.index ["group_id"], name: "index_qingflow_group_forms_on_group_id"
  end

  create_table "qingflow_groups", force: :cascade do |t|
    t.bigint "application_id"
    t.string "title"
    t.string "description"
    t.string "pdf"
    t.integer "position"
    t.boolean "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pdf_generator_id"
    t.index ["application_id"], name: "index_qingflow_groups_on_application_id"
    t.index ["pdf_generator_id"], name: "index_qingflow_groups_on_pdf_generator_id"
  end

  create_table "qingflow_item_statistics", force: :cascade do |t|
    t.bigint "item_id"
    t.string "key"
    t.jsonb "params"
    t.jsonb "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_qingflow_item_statistics_on_item_id"
  end

  create_table "qingflow_item_temps", force: :cascade do |t|
    t.string "record_key"
    t.jsonb "params"
    t.string "uid"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.integer "operations_count"
  end

  create_table "qingflow_items", force: :cascade do |t|
    t.string "applyid"
    t.jsonb "answers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "logs_count"
    t.string "source"
    t.bigint "organ_id"
    t.string "linked_uid"
    t.jsonb "primary_attrs"
    t.jsonb "attrs"
    t.bigint "version_id"
    t.string "record_key"
    t.jsonb "cached_answers"
    t.jsonb "cached_table"
    t.datetime "last_sync_at"
    t.datetime "apply_at"
    t.jsonb "linked_audits"
    t.string "linked_logs", array: true
    t.string "note"
    t.string "uid"
    t.jsonb "code_answers"
    t.jsonb "params"
    t.datetime "apply_update_at"
    t.string "record_code"
    t.jsonb "title_answers"
    t.jsonb "full_answers"
    t.index ["applyid"], name: "index_qingflow_items_on_applyid"
    t.index ["organ_id"], name: "index_qingflow_items_on_organ_id"
    t.index ["version_id"], name: "index_qingflow_items_on_version_id"
  end

  create_table "qingflow_linkers", force: :cascade do |t|
    t.bigint "app_id"
    t.string "type"
    t.jsonb "request"
    t.jsonb "response"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "version_number"
    t.string "source"
    t.integer "operations_count"
    t.string "job_id"
    t.datetime "operated_at"
    t.index ["app_id"], name: "index_qingflow_linkers_on_app_id"
  end

  create_table "qingflow_logs", force: :cascade do |t|
    t.bigint "item_id"
    t.string "related_type"
    t.bigint "related_id"
    t.string "exception"
    t.string "exception_backtrace", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_qingflow_logs_on_item_id"
    t.index ["related_type", "related_id"], name: "index_qingflow_logs_on_related"
  end

  create_table "qingflow_operations", force: :cascade do |t|
    t.jsonb "params"
    t.string "request_id"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.string "note"
    t.boolean "auditable"
    t.boolean "audit_result"
    t.string "applyid"
    t.bigint "app_id"
    t.boolean "syncing"
    t.string "linker_type"
    t.string "record_key"
    t.string "operate_type"
    t.bigint "operate_id"
    t.string "apply_user"
    t.index ["app_id"], name: "index_qingflow_operations_on_app_id"
    t.index ["operate_type", "operate_id"], name: "index_qingflow_operations_on_operate"
  end

  create_table "qingflow_pdf_generators", force: :cascade do |t|
    t.bigint "app_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_qingflow_pdf_generators_on_app_id"
  end

  create_table "qingflow_tools", force: :cascade do |t|
    t.bigint "app_id"
    t.string "type"
    t.string "uid"
    t.jsonb "request"
    t.jsonb "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_qingflow_tools_on_app_id"
  end

  create_table "qingflow_users", force: :cascade do |t|
    t.bigint "app_id"
    t.string "userid"
    t.string "name"
    t.string "email"
    t.string "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.boolean "disabled"
    t.datetime "last_sync_at"
    t.integer "depart_ids", array: true
    t.integer "role_ids", array: true
    t.integer "uid"
    t.string "token"
    t.index ["app_id"], name: "index_qingflow_users_on_app_id"
  end

  create_table "qingflow_versions", force: :cascade do |t|
    t.bigint "app_id"
    t.string "key"
    t.string "name"
    t.string "number"
    t.string "linker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "sync_forms_at"
    t.index ["app_id"], name: "index_qingflow_versions_on_app_id"
  end

  create_table "quip_apps", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "user_id"
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "private_folder_id"
    t.string "name"
    t.string "profile_picture_url"
    t.index ["organ_id"], name: "index_quip_apps_on_organ_id"
    t.index ["user_id"], name: "index_quip_apps_on_user_id"
  end

  create_table "roled_busynesses", force: :cascade do |t|
    t.string "identifier"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "roled_cache_roles", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "cache_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cache_id"], name: "index_roled_cache_roles_on_cache_id"
    t.index ["role_id"], name: "index_roled_cache_roles_on_role_id"
  end

  create_table "roled_caches", force: :cascade do |t|
    t.string "str_role_ids"
    t.jsonb "role_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["str_role_ids"], name: "index_roled_caches_on_str_role_ids"
  end

  create_table "roled_governs", id: :serial, force: :cascade do |t|
    t.integer "position", default: 0
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "namespace_identifier"
    t.string "business_identifier"
    t.string "controller_path"
    t.string "controller_name"
  end

  create_table "roled_name_spaces", force: :cascade do |t|
    t.string "name"
    t.string "identifier"
    t.boolean "verify_organ"
    t.boolean "verify_member"
    t.boolean "verify_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roled_role_rules", id: :serial, force: :cascade do |t|
    t.integer "role_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "params_name"
    t.string "params_identifier"
    t.string "business_identifier"
    t.string "namespace_identifier"
    t.string "action_name"
    t.string "controller_path"
    t.bigint "meta_action_id"
    t.index ["meta_action_id"], name: "index_roled_role_rules_on_meta_action_id"
  end

  create_table "roled_role_types", force: :cascade do |t|
    t.bigint "role_id"
    t.string "who_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roled_role_types_on_role_id"
  end

  create_table "roled_role_whos", force: :cascade do |t|
    t.bigint "role_id"
    t.string "who_type"
    t.bigint "who_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roled_role_whos_on_role_id"
    t.index ["who_type", "who_id"], name: "index_roled_role_whos_on_who"
  end

  create_table "roled_roles", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "visible"
    t.jsonb "role_hash", default: {}
    t.boolean "default"
    t.string "tip"
    t.bigint "organ_id"
    t.index ["organ_id"], name: "index_roled_roles_on_organ_id"
  end

  create_table "roled_rule_operations", force: :cascade do |t|
    t.string "action_name"
    t.string "operation", default: "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roled_rules", id: :serial, force: :cascade do |t|
    t.integer "position", default: 0
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "namespace_identifier"
    t.string "business_identifier"
    t.string "action_name"
    t.string "operation", default: "read"
    t.string "controller_path"
    t.string "controller_name"
    t.string "path"
    t.string "verb"
    t.string "required_parts", array: true
    t.boolean "landmark"
  end

  create_table "roled_tabs", force: :cascade do |t|
    t.bigint "role_id"
    t.string "name"
    t.string "path"
    t.string "icon"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "namespace"
    t.index ["role_id"], name: "index_roled_tabs_on_role_id"
  end

  create_table "roled_who_roles", force: :cascade do |t|
    t.bigint "who_id"
    t.bigint "role_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "type"
    t.index ["role_id"], name: "index_roled_who_roles_on_role_id"
  end

  create_table "serve_servers", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "member_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_serve_servers_on_member_id"
    t.index ["service_id"], name: "index_serve_servers_on_service_id"
  end

  create_table "serve_services", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.string "sku"
    t.decimal "price", default: "0.0"
    t.decimal "advance_price", default: "0.0"
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.jsonb "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.string "good_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_serve_services_on_organ_id"
  end

  create_table "serve_servings", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "server_id"
    t.bigint "member_id"
    t.bigint "wallet_payment_id"
    t.bigint "item_id"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.datetime "estimate_finish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_serve_servings_on_item_id"
    t.index ["member_id"], name: "index_serve_servings_on_member_id"
    t.index ["server_id"], name: "index_serve_servings_on_server_id"
    t.index ["service_id"], name: "index_serve_servings_on_service_id"
    t.index ["wallet_payment_id"], name: "index_serve_servings_on_wallet_payment_id"
  end

  create_table "ship_address_organs", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "address_id"
    t.string "kind"
    t.boolean "default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_ship_address_organs_on_address_id"
    t.index ["organ_id"], name: "index_ship_address_organs_on_organ_id"
  end

  create_table "ship_address_uses", force: :cascade do |t|
    t.bigint "address_id"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_ship_address_uses_on_address_id"
  end

  create_table "ship_addresses", force: :cascade do |t|
    t.bigint "area_id"
    t.string "detail"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name"
    t.string "contact_person"
    t.string "tel"
    t.string "post_code"
    t.string "source"
    t.string "cached_key"
    t.json "area_ancestors"
    t.bigint "station_id"
    t.string "floor", comment: "楼层"
    t.string "room", comment: "房间号"
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "member_organ_id"
    t.bigint "organ_id"
    t.boolean "principal", default: false
    t.bigint "client_id"
    t.bigint "contact_id"
    t.bigint "agent_id"
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

  create_table "ship_area_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "area_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "area_desc_idx"
  end

  create_table "ship_areas", force: :cascade do |t|
    t.string "name"
    t.bigint "parent_id"
    t.boolean "published", default: true
    t.boolean "popular", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.json "parent_ancestors"
    t.string "timezone"
    t.string "locale"
    t.string "full"
    t.string "code"
    t.jsonb "names"
    t.index ["parent_id"], name: "index_ship_areas_on_parent_id"
  end

  create_table "ship_box_buys", force: :cascade do |t|
    t.bigint "box_specification_id"
    t.bigint "organ_id"
    t.integer "buyable_count", default: 0
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_specification_id"], name: "index_ship_box_buys_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_buys_on_organ_id"
  end

  create_table "ship_box_holds", force: :cascade do |t|
    t.bigint "box_specification_id"
    t.bigint "organ_id"
    t.bigint "user_id"
    t.bigint "member_id"
    t.integer "boxes_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_organ_id"
    t.integer "rented_amount"
    t.integer "owned_amount"
    t.integer "box_host_id"
    t.index ["box_specification_id"], name: "index_ship_box_holds_on_box_specification_id"
    t.index ["member_id"], name: "index_ship_box_holds_on_member_id"
    t.index ["member_organ_id"], name: "index_ship_box_holds_on_member_organ_id"
    t.index ["organ_id"], name: "index_ship_box_holds_on_organ_id"
    t.index ["user_id"], name: "index_ship_box_holds_on_user_id"
  end

  create_table "ship_box_hosts", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "box_specification_id"
    t.integer "boxes_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "tradable_count", comment: "可交易数量，可租亦可卖"
    t.virtual "traded_count", type: :integer, as: "(boxes_count - tradable_count)", stored: true
    t.string "rent_unit"
    t.integer "rent_charges_count"
    t.decimal "step", comment: "Item Number Step"
    t.index ["box_specification_id"], name: "index_ship_box_hosts_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_hosts_on_organ_id"
  end

  create_table "ship_box_logs", force: :cascade do |t|
    t.bigint "box_id"
    t.datetime "boxed_in_at"
    t.datetime "boxed_out_at"
    t.integer "duration"
    t.string "confirm_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "boxed_type"
    t.bigint "boxed_id"
    t.index ["box_id"], name: "index_ship_box_logs_on_box_id"
    t.index ["boxed_type", "boxed_id"], name: "index_ship_box_logs_on_boxed"
  end

  create_table "ship_box_proxy_buys", force: :cascade do |t|
    t.bigint "box_specification_id"
    t.bigint "organ_id"
    t.integer "buyable_count"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "box_host_id"
    t.index ["box_host_id"], name: "index_ship_box_proxy_buys_on_box_host_id"
    t.index ["box_specification_id"], name: "index_ship_box_proxy_buys_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_proxy_buys_on_organ_id"
  end

  create_table "ship_box_proxy_sells", force: :cascade do |t|
    t.bigint "box_specification_id"
    t.bigint "organ_id"
    t.integer "sellable_count"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_specification_id"], name: "index_ship_box_proxy_sells_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_proxy_sells_on_organ_id"
  end

  create_table "ship_box_sells", force: :cascade do |t|
    t.bigint "box_specification_id"
    t.bigint "organ_id"
    t.decimal "price", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "member_organ_id"
    t.integer "amount"
    t.integer "done_amount"
    t.integer "rest_amount"
    t.string "state"
    t.index ["box_specification_id"], name: "index_ship_box_sells_on_box_specification_id"
    t.index ["member_id"], name: "index_ship_box_sells_on_member_id"
    t.index ["member_organ_id"], name: "index_ship_box_sells_on_member_organ_id"
    t.index ["organ_id"], name: "index_ship_box_sells_on_organ_id"
    t.index ["user_id"], name: "index_ship_box_sells_on_user_id"
  end

  create_table "ship_box_specifications", force: :cascade do |t|
    t.string "name"
    t.integer "width"
    t.integer "length"
    t.integer "height"
    t.integer "boxes_count", default: 0
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "ship_boxes", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "box_specification_id"
    t.string "code"
    t.string "status"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shipment_items_count", default: 0
    t.integer "box_logs_count", default: 0
    t.index ["box_specification_id"], name: "index_ship_boxes_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_boxes_on_organ_id"
  end

  create_table "ship_car_drivers", force: :cascade do |t|
    t.bigint "car_id"
    t.bigint "driver_id"
    t.jsonb "repeat_days"
    t.string "event_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_ship_car_drivers_on_car_id"
    t.index ["driver_id"], name: "index_ship_car_drivers_on_driver_id"
  end

  create_table "ship_cars", force: :cascade do |t|
    t.string "location"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "detail"
    t.bigint "organ_id"
    t.string "brand", comment: "车品牌"
    t.string "tel", comment: "随车电话"
    t.string "carriage"
    t.string "kind"
    t.bigint "user_id"
    t.index ["organ_id"], name: "index_ship_cars_on_organ_id"
    t.index ["user_id"], name: "index_ship_cars_on_user_id"
  end

  create_table "ship_drivers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "detail"
    t.bigint "organ_id"
    t.bigint "member_id"
    t.index ["member_id"], name: "index_ship_drivers_on_member_id"
    t.index ["organ_id"], name: "index_ship_drivers_on_organ_id"
    t.index ["user_id"], name: "index_ship_drivers_on_user_id"
  end

  create_table "ship_favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remark"
    t.index ["driver_id"], name: "index_ship_favorites_on_driver_id"
    t.index ["user_id"], name: "index_ship_favorites_on_user_id"
  end

  create_table "ship_item_shipments", force: :cascade do |t|
    t.string "item_type"
    t.bigint "item_id"
    t.bigint "shipment_id"
    t.datetime "loaded_at"
    t.datetime "unloaded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_type", "item_id"], name: "index_ship_item_shipments_on_item"
    t.index ["shipment_id"], name: "index_ship_item_shipments_on_shipment_id"
  end

  create_table "ship_line_similars", force: :cascade do |t|
    t.bigint "line_id"
    t.bigint "similar_id"
    t.integer "position"
    t.decimal "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_ship_line_similars_on_line_id"
    t.index ["similar_id"], name: "index_ship_line_similars_on_similar_id"
  end

  create_table "ship_line_stations", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "line_id"
    t.bigint "station_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "expected_minutes", comment: "预计到下站分钟数"
    t.index ["line_id"], name: "index_ship_line_stations_on_line_id"
    t.index ["organ_id"], name: "index_ship_line_stations_on_organ_id"
    t.index ["station_id"], name: "index_ship_line_stations_on_station_id"
  end

  create_table "ship_lines", force: :cascade do |t|
    t.string "start_name"
    t.string "finish_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "line_stations_count", default: 0
  end

  create_table "ship_locations", force: :cascade do |t|
    t.bigint "area_id"
    t.string "poiname"
    t.string "poiaddress"
    t.string "cityname"
    t.decimal "lat", precision: 10, scale: 8
    t.decimal "lng", precision: 11, scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.point "coordinate"
    t.string "name"
    t.bigint "way_id"
    t.bigint "station_id"
    t.jsonb "area_ancestors"
    t.index ["area_id"], name: "index_ship_locations_on_area_id"
    t.index ["station_id"], name: "index_ship_locations_on_station_id"
    t.index ["way_id"], name: "index_ship_locations_on_way_id"
  end

  create_table "ship_package_shipments", force: :cascade do |t|
    t.bigint "box_id"
    t.bigint "package_id"
    t.bigint "shipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_ship_package_shipments_on_box_id"
    t.index ["package_id"], name: "index_ship_package_shipments_on_package_id"
    t.index ["shipment_id"], name: "index_ship_package_shipments_on_shipment_id"
  end

  create_table "ship_packageds", force: :cascade do |t|
    t.bigint "package_id"
    t.bigint "trade_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "trade_item_status"
    t.string "good_item_type"
    t.bigint "good_item_id"
    t.index ["good_item_type", "good_item_id"], name: "index_ship_packageds_on_good_item"
    t.index ["package_id"], name: "index_ship_packageds_on_package_id"
    t.index ["trade_item_id"], name: "index_ship_packageds_on_trade_item_id"
  end

  create_table "ship_packages", force: :cascade do |t|
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "expected_on"
    t.string "pick_mode"
    t.bigint "address_id"
    t.bigint "user_id"
    t.bigint "produce_plan_id"
    t.bigint "box_id"
    t.datetime "boxed_in_at"
    t.datetime "boxed_out_at"
    t.bigint "organ_id"
    t.bigint "from_address_id"
    t.bigint "from_station_id"
    t.bigint "station_id"
    t.bigint "current_shipment_id"
    t.string "confirm_mode"
    t.integer "packageds_count", default: 0
    t.integer "shipment_items_count", default: 0
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

  create_table "ship_shipment_items", force: :cascade do |t|
    t.bigint "shipment_id"
    t.datetime "loaded_at"
    t.datetime "unloaded_at"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "loaded_station_id"
    t.bigint "unloaded_station_id"
    t.bigint "package_id"
    t.bigint "box_id"
    t.string "confirm_mode"
    t.string "status"
    t.bigint "station_id"
    t.index ["box_id"], name: "index_ship_shipment_items_on_box_id"
    t.index ["loaded_station_id"], name: "index_ship_shipment_items_on_loaded_station_id"
    t.index ["package_id"], name: "index_ship_shipment_items_on_package_id"
    t.index ["shipment_id"], name: "index_ship_shipment_items_on_shipment_id"
    t.index ["station_id"], name: "index_ship_shipment_items_on_station_id"
    t.index ["unloaded_station_id"], name: "index_ship_shipment_items_on_unloaded_station_id"
  end

  create_table "ship_shipment_logs", force: :cascade do |t|
    t.bigint "shipment_id"
    t.bigint "station_id"
    t.datetime "expected_leave_at"
    t.datetime "left_at"
    t.datetime "arrived_at"
    t.datetime "prepared_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_ship_shipment_logs_on_shipment_id"
    t.index ["station_id"], name: "index_ship_shipment_logs_on_station_id"
  end

  create_table "ship_shipments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shipping_type"
    t.bigint "shipping_id"
    t.string "state"
    t.bigint "line_id"
    t.bigint "car_id"
    t.bigint "driver_id"
    t.string "type"
    t.datetime "left_at"
    t.datetime "arrived_at"
    t.date "load_on"
    t.bigint "organ_id"
    t.integer "shipment_items_count", default: 0
    t.integer "expected_minutes", comment: "预计路途分钟数"
    t.bigint "current_line_station_id"
    t.datetime "expected_leave_at"
    t.datetime "expected_arrive_at"
    t.index ["car_id"], name: "index_ship_shipments_on_car_id"
    t.index ["current_line_station_id"], name: "index_ship_shipments_on_current_line_station_id"
    t.index ["driver_id"], name: "index_ship_shipments_on_driver_id"
    t.index ["line_id"], name: "index_ship_shipments_on_line_id"
    t.index ["organ_id"], name: "index_ship_shipments_on_organ_id"
    t.index ["shipping_type", "shipping_id"], name: "index_ship_shipments_on_shipping_type_and_shipping_id"
  end

  create_table "ship_stations", force: :cascade do |t|
    t.bigint "area_id"
    t.string "name"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.jsonb "area_ancestors"
    t.string "poiname"
    t.string "poiaddress"
    t.string "cityname"
    t.decimal "lat"
    t.decimal "lng"
    t.point "coordinate"
    t.index ["area_id"], name: "index_ship_stations_on_area_id"
    t.index ["organ_id"], name: "index_ship_stations_on_organ_id"
  end

  create_table "ship_user_lines", force: :cascade do |t|
    t.bigint "line_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_ship_user_lines_on_line_id"
    t.index ["user_id"], name: "index_ship_user_lines_on_user_id"
  end

  create_table "ship_ways", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "user_id"
    t.bigint "line_id"
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

  create_table "solid_cache_entries", force: :cascade do |t|
    t.binary "key", null: false
    t.binary "value", null: false
    t.datetime "created_at", null: false
    t.bigint "key_hash", null: false
    t.integer "byte_size", null: false
    t.index ["byte_size"], name: "index_solid_cache_entries_on_byte_size"
    t.index ["key_hash", "byte_size"], name: "index_solid_cache_entries_on_key_hash_and_byte_size"
    t.index ["key_hash"], name: "index_solid_cache_entries_on_key_hash", unique: true
  end

  create_table "solid_queue_blocked_executions", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.string "queue_name", null: false
    t.integer "priority", default: 0, null: false
    t.string "concurrency_key", null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.index ["concurrency_key", "priority", "job_id"], name: "index_solid_queue_blocked_executions_for_release"
    t.index ["expires_at", "concurrency_key"], name: "index_solid_queue_blocked_executions_for_maintenance"
    t.index ["job_id"], name: "index_solid_queue_blocked_executions_on_job_id", unique: true
  end

  create_table "solid_queue_claimed_executions", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "process_id"
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_claimed_executions_on_job_id", unique: true
    t.index ["process_id", "job_id"], name: "index_solid_queue_claimed_executions_on_process_id_and_job_id"
  end

  create_table "solid_queue_failed_executions", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.text "error"
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_failed_executions_on_job_id", unique: true
  end

  create_table "solid_queue_jobs", force: :cascade do |t|
    t.string "queue_name", null: false
    t.string "class_name", null: false
    t.text "arguments"
    t.integer "priority", default: 0, null: false
    t.string "active_job_id"
    t.datetime "scheduled_at"
    t.datetime "finished_at"
    t.string "concurrency_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_job_id"], name: "index_solid_queue_jobs_on_active_job_id"
    t.index ["class_name"], name: "index_solid_queue_jobs_on_class_name"
    t.index ["finished_at"], name: "index_solid_queue_jobs_on_finished_at"
    t.index ["queue_name", "finished_at"], name: "index_solid_queue_jobs_for_filtering"
    t.index ["scheduled_at", "finished_at"], name: "index_solid_queue_jobs_for_alerting"
  end

  create_table "solid_queue_pauses", force: :cascade do |t|
    t.string "queue_name", null: false
    t.datetime "created_at", null: false
    t.index ["queue_name"], name: "index_solid_queue_pauses_on_queue_name", unique: true
  end

  create_table "solid_queue_processes", force: :cascade do |t|
    t.string "kind", null: false
    t.datetime "last_heartbeat_at", null: false
    t.bigint "supervisor_id"
    t.integer "pid", null: false
    t.string "hostname"
    t.text "metadata"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.index ["last_heartbeat_at"], name: "index_solid_queue_processes_on_last_heartbeat_at"
    t.index ["name", "supervisor_id"], name: "index_solid_queue_processes_on_name_and_supervisor_id", unique: true
    t.index ["supervisor_id"], name: "index_solid_queue_processes_on_supervisor_id"
  end

  create_table "solid_queue_ready_executions", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.string "queue_name", null: false
    t.integer "priority", default: 0, null: false
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_ready_executions_on_job_id", unique: true
    t.index ["priority", "job_id"], name: "index_solid_queue_poll_all"
    t.index ["queue_name", "priority", "job_id"], name: "index_solid_queue_poll_by_queue"
  end

  create_table "solid_queue_recurring_executions", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.string "task_key", null: false
    t.datetime "run_at", null: false
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_recurring_executions_on_job_id", unique: true
    t.index ["task_key", "run_at"], name: "index_solid_queue_recurring_executions_on_task_key_and_run_at", unique: true
  end

  create_table "solid_queue_recurring_tasks", force: :cascade do |t|
    t.string "key", null: false
    t.string "schedule", null: false
    t.string "command", limit: 2048
    t.string "class_name"
    t.text "arguments"
    t.string "queue_name"
    t.integer "priority", default: 0
    t.boolean "static", default: true, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_solid_queue_recurring_tasks_on_key", unique: true
    t.index ["static"], name: "index_solid_queue_recurring_tasks_on_static"
  end

  create_table "solid_queue_scheduled_executions", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.string "queue_name", null: false
    t.integer "priority", default: 0, null: false
    t.datetime "scheduled_at", null: false
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_scheduled_executions_on_job_id", unique: true
    t.index ["scheduled_at", "priority", "job_id"], name: "index_solid_queue_dispatch_all"
  end

  create_table "solid_queue_semaphores", force: :cascade do |t|
    t.string "key", null: false
    t.integer "value", default: 1, null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expires_at"], name: "index_solid_queue_semaphores_on_expires_at"
    t.index ["key", "value"], name: "index_solid_queue_semaphores_on_key_and_value"
    t.index ["key"], name: "index_solid_queue_semaphores_on_key", unique: true
  end

  create_table "space_buildings", force: :cascade do |t|
    t.bigint "station_id"
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_space_buildings_on_station_id"
  end

  create_table "space_desks", force: :cascade do |t|
    t.bigint "room_id"
    t.string "name"
    t.string "code"
    t.integer "width"
    t.integer "height"
    t.integer "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.index ["organ_id"], name: "index_space_desks_on_organ_id"
    t.index ["room_id"], name: "index_space_desks_on_room_id"
  end

  create_table "space_grids", force: :cascade do |t|
    t.bigint "room_id"
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

  create_table "space_rooms", force: :cascade do |t|
    t.bigint "station_id"
    t.bigint "building_id"
    t.string "name"
    t.string "code"
    t.integer "floor"
    t.integer "grids_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.index ["building_id"], name: "index_space_rooms_on_building_id"
    t.index ["organ_id"], name: "index_space_rooms_on_organ_id"
    t.index ["station_id"], name: "index_space_rooms_on_station_id"
  end

  create_table "space_stations", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "area_id"
    t.string "name"
    t.string "code"
    t.string "detail"
    t.integer "buildings_count"
    t.integer "rooms_count"
    t.jsonb "area_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "poiname"
    t.string "poiaddress"
    t.string "cityname"
    t.decimal "lat"
    t.decimal "lng"
    t.point "coordinate"
    t.index ["area_id"], name: "index_space_stations_on_area_id"
    t.index ["organ_id"], name: "index_space_stations_on_organ_id"
  end

  create_table "statis_configs", force: :cascade do |t|
    t.string "statistical_type"
    t.integer "year"
    t.date "begin_on"
    t.date "end_on"
    t.string "note"
    t.jsonb "keys"
    t.jsonb "scopes"
    t.date "today"
    t.integer "today_begin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statis_counter_days", force: :cascade do |t|
    t.string "counter_type"
    t.bigint "counter_id"
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.string "year_month"
    t.date "date"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counter_type", "counter_id"], name: "index_statis_counter_days_on_counter"
    t.index ["year_month"], name: "index_statis_counter_days_on_year_month"
  end

  create_table "statis_counter_months", force: :cascade do |t|
    t.string "counter_type"
    t.bigint "counter_id"
    t.integer "year"
    t.integer "month"
    t.string "year_month"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counter_type", "counter_id"], name: "index_statis_counter_months_on_counter"
    t.index ["year_month"], name: "index_statis_counter_months_on_year_month"
  end

  create_table "statis_counter_ones", force: :cascade do |t|
    t.bigint "config_id"
    t.string "scope"
    t.boolean "cached"
    t.integer "counter_years_count"
    t.integer "counter_months_count"
    t.integer "counter_days_count"
    t.string "key_first"
    t.string "value_first"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["config_id"], name: "index_statis_counter_ones_on_config_id"
  end

  create_table "statis_counter_years", force: :cascade do |t|
    t.string "counter_type"
    t.bigint "counter_id"
    t.integer "year"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counter_type", "counter_id"], name: "index_statis_counter_years_on_counter"
  end

  create_table "statis_statistic_days", force: :cascade do |t|
    t.bigint "statistic_id"
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

  create_table "statis_statistic_months", force: :cascade do |t|
    t.bigint "statistic_id"
    t.integer "year"
    t.integer "month"
    t.string "year_month"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["statistic_id"], name: "index_statis_statistic_months_on_statistic_id"
    t.index ["year_month"], name: "index_statis_statistic_months_on_year_month"
  end

  create_table "statis_statistic_years", force: :cascade do |t|
    t.bigint "statistic_id"
    t.integer "year"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["statistic_id"], name: "index_statis_statistic_years_on_statistic_id"
  end

  create_table "statis_statistics", force: :cascade do |t|
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

  create_table "stats", force: :cascade do |t|
    t.integer "subscribed_requests_count"
    t.integer "oauth_users_count"
    t.integer "users_count"
    t.integer "requirements_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
  end

  create_table "sync_apps", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.string "appid"
    t.string "secret"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "refresh_token"
    t.datetime "refresh_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "base_url"
    t.index ["appid"], name: "index_sync_apps_on_appid"
    t.index ["organ_id"], name: "index_sync_apps_on_organ_id"
  end

  create_table "sync_audits", force: :cascade do |t|
    t.string "synchro_type"
    t.bigint "synchro_id"
    t.string "operator_type"
    t.bigint "operator_id"
    t.bigint "destined_id"
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

  create_table "sync_form_hierarchies", force: :cascade do |t|
    t.bigint "ancestor_id"
    t.bigint "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "sync/form_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_sync_form_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_sync_form_hierarchies_on_descendant_id"
  end

  create_table "sync_forms", force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "meta_column_id"
    t.jsonb "parent_ancestors"
    t.string "name"
    t.string "column_name"
    t.string "record_name"
    t.boolean "display"
    t.boolean "primary"
    t.boolean "modeling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.string "external_column_name"
    t.string "external_record_name"
    t.bigint "record_id"
    t.index ["meta_column_id"], name: "index_sync_forms_on_meta_column_id"
    t.index ["organ_id"], name: "index_sync_forms_on_organ_id"
    t.index ["parent_id"], name: "index_sync_forms_on_parent_id"
    t.index ["record_id"], name: "index_sync_forms_on_record_id"
  end

  create_table "sync_items", force: :cascade do |t|
    t.string "identifier"
    t.jsonb "values"
    t.integer "logs_count"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.bigint "record_id"
    t.index ["identifier"], name: "index_sync_items_on_identifier"
    t.index ["organ_id"], name: "index_sync_items_on_organ_id"
    t.index ["record_id"], name: "index_sync_items_on_record_id"
  end

  create_table "sync_logs", force: :cascade do |t|
    t.bigint "item_id"
    t.string "related_type"
    t.bigint "related_id"
    t.string "exception"
    t.string "exception_backtrace", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_sync_logs_on_item_id"
    t.index ["related_type", "related_id"], name: "index_sync_logs_on_related"
  end

  create_table "sync_records", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "app_id"
    t.string "name"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_sync_records_on_app_id"
    t.index ["organ_id"], name: "index_sync_records_on_organ_id"
  end

  create_table "trade_addition_charges", force: :cascade do |t|
    t.bigint "addition_id"
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

  create_table "trade_additions", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "deal_type"
    t.bigint "deal_id"
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

  create_table "trade_advances", force: :cascade do |t|
    t.decimal "price", precision: 10, scale: 2
    t.string "apple_product_id"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "card_template_id"
    t.string "name"
    t.string "sku"
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.boolean "open", default: false
    t.bigint "wallet_template_id"
    t.string "good_type"
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.bigint "organ_id"
    t.boolean "lawful", comment: "是否法币"
    t.decimal "step", comment: "Item Number Step"
    t.index ["card_template_id"], name: "index_trade_advances_on_card_template_id"
    t.index ["organ_id"], name: "index_trade_advances_on_organ_id"
    t.index ["wallet_template_id"], name: "index_trade_advances_on_wallet_template_id"
  end

  create_table "trade_card_advances", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "advance_id"
    t.bigint "trade_item_id"
    t.decimal "price", precision: 10, scale: 2
    t.decimal "amount", precision: 10, scale: 2
    t.string "state"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "note"
    t.string "kind"
    t.bigint "card_prepayment_id"
    t.index ["advance_id"], name: "index_trade_card_advances_on_advance_id"
    t.index ["card_id"], name: "index_trade_card_advances_on_card_id"
    t.index ["card_prepayment_id"], name: "index_trade_card_advances_on_card_prepayment_id"
    t.index ["trade_item_id"], name: "index_trade_card_advances_on_trade_item_id"
  end

  create_table "trade_card_logs", force: :cascade do |t|
    t.bigint "card_id"
    t.string "source_type"
    t.bigint "source_id"
    t.decimal "amount", precision: 10, scale: 2
    t.string "title"
    t.string "tag_str"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["card_id"], name: "index_trade_card_logs_on_card_id"
    t.index ["source_type", "source_id"], name: "index_trade_card_logs_on_source_type_and_source_id"
  end

  create_table "trade_card_prepayments", force: :cascade do |t|
    t.bigint "card_template_id"
    t.string "token"
    t.decimal "amount"
    t.datetime "expire_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_template_id"], name: "index_trade_card_prepayments_on_card_template_id"
  end

  create_table "trade_card_promotes", force: :cascade do |t|
    t.bigint "card_template_id"
    t.bigint "promote_id"
    t.decimal "income_min", precision: 10, scale: 2, default: "0.0"
    t.decimal "income_max", precision: 10, scale: 2, default: "99999999.99"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_template_id"], name: "index_trade_card_promotes_on_card_template_id"
    t.index ["promote_id"], name: "index_trade_card_promotes_on_promote_id"
  end

  create_table "trade_card_purchases", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "item_id"
    t.bigint "purchase_id"
    t.decimal "price"
    t.integer "days", default: 0
    t.integer "months", default: 0
    t.integer "years", default: 0
    t.string "state"
    t.string "note"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_expire_at"
    t.index ["card_id"], name: "index_trade_card_purchases_on_card_id"
    t.index ["item_id"], name: "index_trade_card_purchases_on_item_id"
    t.index ["purchase_id"], name: "index_trade_card_purchases_on_purchase_id"
  end

  create_table "trade_card_templates", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "description"
    t.string "text_color"
    t.integer "cards_count", default: 0
    t.string "code"
    t.integer "grade", default: 1, comment: "会员级别"
    t.bigint "promote_id"
    t.bigint "parent_id"
    t.boolean "enabled"
    t.index ["organ_id"], name: "index_trade_card_templates_on_organ_id"
    t.index ["parent_id"], name: "index_trade_card_templates_on_parent_id"
    t.index ["promote_id"], name: "index_trade_card_templates_on_promote_id"
  end

  create_table "trade_cards", force: :cascade do |t|
    t.bigint "organ_id"
    t.bigint "card_template_id"
    t.bigint "client_id"
    t.string "card_uuid"
    t.integer "lock_version"
    t.datetime "effect_at", precision: nil
    t.datetime "expire_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "agency_id"
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "member_organ_id"
    t.boolean "temporary", default: false, comment: "在购物车勾选临时生效"
    t.bigint "contact_id"
    t.bigint "agent_id"
    t.index ["agency_id"], name: "index_trade_cards_on_agency_id"
    t.index ["agent_id"], name: "index_trade_cards_on_agent_id"
    t.index ["card_template_id"], name: "index_trade_cards_on_card_template_id"
    t.index ["contact_id"], name: "index_trade_cards_on_contact_id"
    t.index ["member_id"], name: "index_trade_cards_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_cards_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_cards_on_organ_id"
    t.index ["user_id"], name: "index_trade_cards_on_user_id"
  end

  create_table "trade_cart_promotes", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "organ_id"
    t.bigint "order_id"
    t.bigint "promote_id"
    t.bigint "promote_charge_id"
    t.integer "sequence"
    t.decimal "original_amount", comment: "初始价格"
    t.decimal "based_amount", default: "0.0", comment: "基于此价格计算，默认为 trade_item 的 amount，与sequence有关"
    t.decimal "computed_amount", default: "0.0", comment: "计算出的价格"
    t.decimal "amount", default: "0.0", comment: "默认等于 computed_amount，如果客服人员修改过价格后，则 amount 会发生变化"
    t.string "note", comment: "备注"
    t.boolean "edited", default: false, comment: "是否被客服改过价"
    t.string "promote_name"
    t.string "status", default: "init"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "value"
    t.jsonb "unit_prices"
    t.index ["cart_id"], name: "index_trade_cart_promotes_on_cart_id"
    t.index ["order_id"], name: "index_trade_cart_promotes_on_order_id"
    t.index ["organ_id"], name: "index_trade_cart_promotes_on_organ_id"
    t.index ["promote_charge_id"], name: "index_trade_cart_promotes_on_promote_charge_id"
    t.index ["promote_id"], name: "index_trade_cart_promotes_on_promote_id"
  end

  create_table "trade_carts", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id"
    t.bigint "payment_strategy_id"
    t.integer "deposit_ratio"
    t.bigint "organ_id"
    t.decimal "retail_price", default: "0.0", comment: "商品汇总的原价"
    t.decimal "discount_price", default: "0.0"
    t.decimal "bulk_price", default: "0.0"
    t.decimal "total_quantity", default: "0.0"
    t.decimal "item_amount", default: "0.0"
    t.decimal "overall_additional_amount", default: "0.0"
    t.decimal "overall_reduced_amount", default: "0.0"
    t.bigint "address_id"
    t.integer "lock_version"
    t.decimal "original_amount", default: "0.0", comment: "原价，应用优惠之前的价格"
    t.bigint "member_id"
    t.bigint "member_organ_id"
    t.boolean "auto", default: false, comment: "自动下单"
    t.jsonb "extra", default: {}
    t.string "good_type"
    t.string "aim"
    t.integer "items_count", default: 0
    t.bigint "client_id"
    t.boolean "fresh"
    t.decimal "advance_amount"
    t.bigint "contact_id"
    t.bigint "agent_id"
    t.boolean "purchasable"
    t.bigint "desk_id"
    t.bigint "station_id"
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

  create_table "trade_cash_givens", force: :cascade do |t|
    t.bigint "cash_id"
    t.bigint "organ_id"
    t.string "title"
    t.decimal "amount", default: "0.0"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cash_id"], name: "index_trade_cash_givens_on_cash_id"
    t.index ["organ_id"], name: "index_trade_cash_givens_on_organ_id"
  end

  create_table "trade_cash_logs", force: :cascade do |t|
    t.bigint "cash_id"
    t.bigint "user_id"
    t.string "source_type"
    t.bigint "source_id"
    t.decimal "amount", precision: 10, scale: 2
    t.string "title"
    t.string "tag_str"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["cash_id"], name: "index_trade_cash_logs_on_cash_id"
    t.index ["source_type", "source_id"], name: "index_trade_cash_logs_on_source_type_and_source_id"
    t.index ["user_id"], name: "index_trade_cash_logs_on_user_id"
  end

  create_table "trade_cashes", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "income_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "expense_amount", precision: 10, scale: 2, default: "0.0"
    t.integer "lock_version"
    t.string "account_bank"
    t.string "account_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "account_number"
    t.index ["user_id"], name: "index_trade_cashes_on_user_id"
  end

  create_table "trade_deliveries", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "member_organ_id"
    t.bigint "organ_id"
    t.bigint "scene_id"
    t.bigint "order_id"
    t.boolean "fetch_oneself", comment: "自取"
    t.datetime "fetch_start_at"
    t.datetime "fetch_finish_at"
    t.date "produce_on", comment: "对接生产管理"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.bigint "contact_id"
    t.bigint "agent_id"
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

  create_table "trade_exchange_rates", force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_holds", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "member_organ_id"
    t.bigint "item_id"
    t.string "rentable_type"
    t.bigint "rentable_id"
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

  create_table "trade_item_promotes", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "promote_good_id"
    t.bigint "promote_id"
    t.decimal "amount", default: "0.0"
    t.string "promote_name"
    t.string "status", default: "init"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "promote_charge_id"
    t.decimal "value"
    t.decimal "original_amount"
    t.decimal "unit_price"
    t.index ["item_id"], name: "index_trade_item_promotes_on_item_id"
    t.index ["promote_charge_id"], name: "index_trade_item_promotes_on_promote_charge_id"
    t.index ["promote_good_id"], name: "index_trade_item_promotes_on_promote_good_id"
    t.index ["promote_id"], name: "index_trade_item_promotes_on_promote_id"
  end

  create_table "trade_items", force: :cascade do |t|
    t.string "good_type"
    t.bigint "good_id"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.decimal "number"
    t.decimal "reduced_amount", precision: 10, scale: 2
    t.decimal "additional_amount", precision: 10, scale: 2
    t.decimal "single_price", precision: 10, scale: 2
    t.string "status"
    t.string "good_name"
    t.decimal "weight", default: "0.0", comment: "重量"
    t.string "note"
    t.decimal "advance_amount", default: "0.0"
    t.json "extra", default: {}
    t.bigint "address_id"
    t.bigint "user_id"
    t.bigint "order_id"
    t.bigint "member_id"
    t.datetime "expire_at"
    t.bigint "organ_id"
    t.bigint "member_organ_id"
    t.string "vip_code"
    t.string "aim", default: "use"
    t.bigint "station_id"
    t.bigint "from_address_id"
    t.bigint "from_station_id"
    t.bigint "current_cart_id"
    t.string "uuid"
    t.integer "volume", default: 0, comment: "体积"
    t.bigint "client_id"
    t.decimal "done_number", comment: "已达成交易数量"
    t.jsonb "wallet_amount"
    t.string "delivery_status"
    t.bigint "operator_id"
    t.integer "holds_count"
    t.bigint "scene_id"
    t.bigint "desk_id"
    t.string "job_id"
    t.date "produce_on", comment: "对接生产管理"
    t.virtual "rest_number", type: :decimal, as: "(number - done_number)", stored: true
    t.string "purchase_status"
    t.integer "purchase_id"
    t.bigint "contact_id"
    t.bigint "agent_id"
    t.string "dispatch"
    t.bigint "source_id"
    t.bigint "unit_id"
    t.integer "purchase_items_count"
    t.bigint "provide_id"
    t.index ["address_id"], name: "index_trade_items_on_address_id"
    t.index ["agent_id"], name: "index_trade_items_on_agent_id"
    t.index ["client_id"], name: "index_trade_items_on_client_id"
    t.index ["contact_id"], name: "index_trade_items_on_contact_id"
    t.index ["current_cart_id"], name: "index_trade_items_on_current_cart_id"
    t.index ["desk_id"], name: "index_trade_items_on_desk_id"
    t.index ["from_address_id"], name: "index_trade_items_on_from_address_id"
    t.index ["from_station_id"], name: "index_trade_items_on_from_station_id"
    t.index ["good_type", "good_id"], name: "index_trade_items_on_good_type_and_good_id"
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

  create_table "trade_orders", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "state"
    t.decimal "amount", precision: 10, scale: 2
    t.decimal "received_amount", precision: 10, scale: 2
    t.decimal "item_amount", precision: 10, scale: 2
    t.string "currency"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "payment_strategy_id"
    t.decimal "overall_reduced_amount", precision: 10, scale: 2
    t.decimal "overall_additional_amount", precision: 10, scale: 2
    t.string "payment_status"
    t.bigint "user_id"
    t.bigint "organ_id"
    t.integer "lock_version"
    t.string "note", limit: 4096
    t.datetime "expire_at", precision: nil
    t.json "extra", default: {}
    t.integer "items_count", default: 0
    t.bigint "address_id"
    t.bigint "produce_plan_id"
    t.decimal "original_amount", default: "0.0", comment: "原价，应用优惠之前的价格"
    t.bigint "member_id"
    t.bigint "member_organ_id"
    t.string "serial_number"
    t.datetime "paid_at"
    t.bigint "station_id"
    t.bigint "from_address_id"
    t.bigint "from_station_id"
    t.bigint "current_cart_id"
    t.bigint "from_user_id"
    t.bigint "from_member_id"
    t.bigint "from_member_organ_id"
    t.datetime "pay_deadline_at"
    t.decimal "unreceived_amount"
    t.string "generate_mode", default: "myself"
    t.bigint "client_id"
    t.boolean "pay_auto"
    t.string "aim"
    t.decimal "adjust_amount"
    t.bigint "operator_id"
    t.decimal "advance_amount"
    t.bigint "contact_id"
    t.bigint "agent_id"
    t.integer "payment_orders_count"
    t.decimal "refunded_amount"
    t.bigint "provide_id"
    t.decimal "payable_amount"
    t.decimal "verifying_amount", comment: "待核销金额"
    t.bigint "desk_id"
    t.integer "deposit_ratio", comment: "最小预付比例"
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
    t.index ["payment_strategy_id"], name: "index_trade_orders_on_payment_strategy_id"
    t.index ["produce_plan_id"], name: "index_trade_orders_on_produce_plan_id"
    t.index ["provide_id"], name: "index_trade_orders_on_provide_id"
    t.index ["station_id"], name: "index_trade_orders_on_station_id"
    t.index ["user_id"], name: "index_trade_orders_on_user_id"
  end

  create_table "trade_payment_methods", force: :cascade do |t|
    t.string "type"
    t.string "account_name"
    t.string "account_num"
    t.string "bank"
    t.text "extra"
    t.boolean "verified"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator_id"
    t.boolean "myself", default: true
    t.index ["creator_id"], name: "index_trade_payment_methods_on_creator_id"
  end

  create_table "trade_payment_orders", force: :cascade do |t|
    t.bigint "payment_id"
    t.bigint "order_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "state"
    t.string "kind"
    t.decimal "payment_amount"
    t.decimal "order_amount"
    t.index ["order_id"], name: "index_trade_payment_orders_on_order_id"
    t.index ["payment_id"], name: "index_trade_payment_orders_on_payment_id"
  end

  create_table "trade_payment_references", force: :cascade do |t|
    t.bigint "payment_method_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "state"
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "organ_id"
    t.bigint "member_organ_id"
    t.index ["member_id"], name: "index_trade_payment_references_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_payment_references_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_payment_references_on_organ_id"
    t.index ["payment_method_id"], name: "index_trade_payment_references_on_payment_method_id"
    t.index ["user_id"], name: "index_trade_payment_references_on_user_id"
  end

  create_table "trade_payment_strategies", force: :cascade do |t|
    t.string "name"
    t.string "strategy"
    t.integer "period", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id"
    t.boolean "from_pay", default: true
    t.index ["organ_id"], name: "index_trade_payment_strategies_on_organ_id"
  end

  create_table "trade_payments", force: :cascade do |t|
    t.string "type", limit: 255
    t.decimal "total_amount", precision: 10, scale: 2
    t.decimal "fee_amount", precision: 10, scale: 2
    t.decimal "income_amount", precision: 10, scale: 2
    t.decimal "checked_amount", precision: 10, scale: 2
    t.decimal "adjust_amount", precision: 10, scale: 2, default: "0.0"
    t.string "payment_uuid", limit: 255
    t.string "notify_type", limit: 255
    t.datetime "notified_at", precision: nil
    t.string "pay_status", limit: 255
    t.string "seller_identifier", limit: 255
    t.string "buyer_name", limit: 255
    t.string "buyer_identifier", limit: 255
    t.string "buyer_bank"
    t.integer "user_id"
    t.string "currency", limit: 255
    t.string "comment"
    t.bigint "payment_method_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "state"
    t.bigint "organ_id"
    t.boolean "verified", default: true
    t.integer "lock_version"
    t.decimal "refunded_amount", default: "0.0"
    t.jsonb "extra", default: {}
    t.bigint "wallet_id"
    t.integer "payment_orders_count", default: 0
    t.integer "payment_id", comment: "for paypal"
    t.bigint "operator_id"
    t.jsonb "extra_params"
    t.integer "refunds_count"
    t.string "appid"
    t.string "pay_state"
    t.decimal "orders_amount", comment: "订单金额汇总"
    t.index ["operator_id"], name: "index_trade_payments_on_operator_id"
    t.index ["organ_id"], name: "index_trade_payments_on_organ_id"
    t.index ["payment_method_id"], name: "index_trade_payments_on_payment_method_id"
    t.index ["wallet_id"], name: "index_trade_payments_on_wallet_id"
  end

  create_table "trade_payouts", force: :cascade do |t|
    t.string "type"
    t.string "payable_type"
    t.bigint "payable_id"
    t.bigint "operator_id"
    t.string "payout_uuid"
    t.decimal "requested_amount", precision: 10, scale: 2
    t.decimal "actual_amount", precision: 10, scale: 2
    t.string "state"
    t.datetime "paid_at", precision: nil
    t.boolean "advance", default: false
    t.string "account_bank"
    t.string "account_name"
    t.string "account_num"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "wallet_id"
    t.index ["operator_id"], name: "index_trade_payouts_on_operator_id"
    t.index ["payable_type", "payable_id"], name: "index_trade_payouts_on_payable_type_and_payable_id"
    t.index ["wallet_id"], name: "index_trade_payouts_on_wallet_id"
  end

  create_table "trade_privileges", force: :cascade do |t|
    t.bigint "card_template_id"
    t.string "name"
    t.integer "amount", comment: "额度"
    t.decimal "price", comment: "价格"
    t.string "code"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "promote_id"
    t.index ["card_template_id"], name: "index_trade_privileges_on_card_template_id"
    t.index ["promote_id"], name: "index_trade_privileges_on_promote_id"
  end

  create_table "trade_promote_carts", force: :cascade do |t|
    t.bigint "promote_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "state"
    t.string "status"
    t.integer "trade_promotes_count", default: 0
    t.bigint "promote_good_id"
    t.datetime "effect_at", precision: nil
    t.datetime "expire_at", precision: nil
    t.bigint "cart_id"
    t.index ["cart_id"], name: "index_trade_promote_carts_on_cart_id"
    t.index ["promote_good_id"], name: "index_trade_promote_carts_on_promote_good_id"
    t.index ["promote_id"], name: "index_trade_promote_carts_on_promote_id"
  end

  create_table "trade_promote_charges", force: :cascade do |t|
    t.bigint "promote_id"
    t.decimal "min", precision: 10, scale: 2, default: "0.0"
    t.decimal "max", precision: 10, scale: 2, default: "99999999.99"
    t.decimal "parameter", precision: 10, scale: 2
    t.string "type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "contain_max"
    t.boolean "contain_min"
    t.decimal "base_price", precision: 10, scale: 2
    t.decimal "filter_min", precision: 10, scale: 2
    t.decimal "filter_max", precision: 10, scale: 2
    t.jsonb "wallet_price"
    t.jsonb "wallet_base_price"
    t.jsonb "extra"
    t.index ["promote_id"], name: "index_trade_promote_charges_on_promote_id"
  end

  create_table "trade_promote_extras", force: :cascade do |t|
    t.bigint "promote_id"
    t.string "extra_name"
    t.string "column_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promote_id"], name: "index_trade_promote_extras_on_promote_id"
  end

  create_table "trade_promote_goods", force: :cascade do |t|
    t.string "good_type"
    t.bigint "good_id"
    t.bigint "promote_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "status"
    t.datetime "effect_at", precision: nil
    t.datetime "expire_at", precision: nil
    t.bigint "organ_id"
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "member_organ_id"
    t.integer "item_promotes_count", default: 0
    t.string "identity"
    t.integer "blacklists_count", default: 0
    t.integer "use_limit"
    t.boolean "over_limit", default: false
    t.string "aim", default: "use"
    t.bigint "client_id"
    t.bigint "contact_id"
    t.bigint "agent_id"
    t.bigint "card_template_id"
    t.bigint "card_id"
    t.bigint "taxon_id"
    t.bigint "part_id"
    t.index ["agent_id"], name: "index_trade_promote_goods_on_agent_id"
    t.index ["card_id"], name: "index_trade_promote_goods_on_card_id"
    t.index ["card_template_id"], name: "index_trade_promote_goods_on_card_template_id"
    t.index ["client_id"], name: "index_trade_promote_goods_on_client_id"
    t.index ["contact_id"], name: "index_trade_promote_goods_on_contact_id"
    t.index ["good_type", "good_id"], name: "index_trade_promote_goods_on_good_type_and_good_id"
    t.index ["member_id"], name: "index_trade_promote_goods_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_promote_goods_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_promote_goods_on_organ_id"
    t.index ["part_id"], name: "index_trade_promote_goods_on_part_id"
    t.index ["promote_id"], name: "index_trade_promote_goods_on_promote_id"
    t.index ["taxon_id"], name: "index_trade_promote_goods_on_taxon_id"
    t.index ["user_id"], name: "index_trade_promote_goods_on_user_id"
  end

  create_table "trade_promotes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "sequence", default: 1
    t.string "extra", array: true
    t.string "short_name"
    t.string "description"
    t.string "code"
    t.string "deal_type"
    t.bigint "deal_id"
    t.string "metering"
    t.boolean "editable"
    t.bigint "organ_id"
    t.string "unit_code"
    t.index ["deal_type", "deal_id"], name: "index_trade_promotes_on_deal_type_and_deal_id"
    t.index ["organ_id"], name: "index_trade_promotes_on_organ_id"
  end

  create_table "trade_purchases", force: :cascade do |t|
    t.bigint "card_template_id"
    t.string "name"
    t.string "sku"
    t.decimal "price"
    t.decimal "advance_price", default: "0.0"
    t.jsonb "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.string "title"
    t.string "note"
    t.integer "years", default: 0
    t.integer "months", default: 0
    t.integer "days", default: 0
    t.boolean "default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "good_type"
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.decimal "step", comment: "Item Number Step"
    t.index ["card_template_id"], name: "index_trade_purchases_on_card_template_id"
  end

  create_table "trade_refund_orders", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "payment_id"
    t.bigint "refund_id"
    t.decimal "payment_amount"
    t.decimal "order_amount", comment: "对应的订单金额"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_trade_refund_orders_on_order_id"
    t.index ["payment_id"], name: "index_trade_refund_orders_on_payment_id"
    t.index ["refund_id"], name: "index_trade_refund_orders_on_refund_id"
  end

  create_table "trade_refunds", force: :cascade do |t|
    t.bigint "payment_id"
    t.bigint "operator_id"
    t.string "type"
    t.decimal "total_amount", precision: 10, scale: 2
    t.string "buyer_identifier"
    t.string "comment", limit: 512
    t.string "state", default: "0"
    t.datetime "refunded_at", precision: nil
    t.string "reason", limit: 512
    t.string "currency"
    t.string "refund_uuid"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.json "response"
    t.bigint "wallet_id"
    t.index ["operator_id"], name: "index_trade_refunds_on_operator_id"
    t.index ["payment_id"], name: "index_trade_refunds_on_payment_id"
    t.index ["wallet_id"], name: "index_trade_refunds_on_wallet_id"
  end

  create_table "trade_rent_charges", force: :cascade do |t|
    t.string "rentable_type"
    t.bigint "rentable_id"
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

  create_table "trade_rents", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "member_organ_id"
    t.string "rentable_type"
    t.bigint "rentable_id"
    t.decimal "amount", comment: "价格小计"
    t.string "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "invest_amount", comment: "投资分成"
    t.string "good_type"
    t.bigint "good_id"
    t.jsonb "extra"
    t.datetime "rent_start_at"
    t.datetime "rent_finish_at"
    t.datetime "rent_present_finish_at"
    t.jsonb "wallet_amount"
    t.datetime "rent_estimate_finish_at"
    t.decimal "estimate_amount"
    t.jsonb "estimate_wallet_amount"
    t.index ["good_type", "good_id"], name: "index_trade_rents_on_good"
    t.index ["member_id"], name: "index_trade_rents_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_rents_on_member_organ_id"
    t.index ["rentable_type", "rentable_id"], name: "index_trade_rents_on_rentable"
    t.index ["user_id"], name: "index_trade_rents_on_user_id"
  end

  create_table "trade_trade_promotes", force: :cascade do |t|
    t.bigint "promote_id"
    t.bigint "promote_charge_id"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "trade_item_id"
    t.bigint "promote_good_id"
    t.integer "sequence"
    t.decimal "based_amount", precision: 10, scale: 2
    t.decimal "original_amount", precision: 10, scale: 2
    t.decimal "computed_amount", precision: 10, scale: 2
    t.string "note"
    t.bigint "promote_cart_id"
    t.boolean "edited", comment: "是否被客服改过价"
    t.bigint "cart_id"
    t.bigint "order_id"
    t.string "status", default: "init"
    t.string "promote_name"
    t.bigint "organ_id"
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "member_organ_id"
    t.index ["cart_id"], name: "index_trade_trade_promotes_on_cart_id"
    t.index ["member_id"], name: "index_trade_trade_promotes_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_trade_promotes_on_member_organ_id"
    t.index ["order_id"], name: "index_trade_trade_promotes_on_order_id"
    t.index ["organ_id"], name: "index_trade_trade_promotes_on_organ_id"
    t.index ["promote_cart_id"], name: "index_trade_trade_promotes_on_promote_cart_id"
    t.index ["promote_charge_id"], name: "index_trade_trade_promotes_on_promote_charge_id"
    t.index ["promote_good_id"], name: "index_trade_trade_promotes_on_promote_good_id"
    t.index ["promote_id"], name: "index_trade_trade_promotes_on_promote_id"
    t.index ["trade_item_id"], name: "index_trade_trade_promotes_on_trade_item_id"
    t.index ["user_id"], name: "index_trade_trade_promotes_on_user_id"
  end

  create_table "trade_units", force: :cascade do |t|
    t.boolean "default"
    t.decimal "rate", comment: "相对于默认单位的计算比率"
    t.string "name"
    t.string "code"
    t.string "metering"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_wallet_advances", force: :cascade do |t|
    t.bigint "wallet_id"
    t.bigint "advance_id"
    t.bigint "item_id"
    t.decimal "price"
    t.decimal "amount"
    t.string "state"
    t.string "note"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "operator_id"
    t.bigint "wallet_prepayment_id"
    t.index ["advance_id"], name: "index_trade_wallet_advances_on_advance_id"
    t.index ["item_id"], name: "index_trade_wallet_advances_on_item_id"
    t.index ["operator_id"], name: "index_trade_wallet_advances_on_operator_id"
    t.index ["wallet_id"], name: "index_trade_wallet_advances_on_wallet_id"
    t.index ["wallet_prepayment_id"], name: "index_trade_wallet_advances_on_wallet_prepayment_id"
  end

  create_table "trade_wallet_frozens", force: :cascade do |t|
    t.bigint "operator_id"
    t.bigint "wallet_id"
    t.bigint "item_id"
    t.decimal "amount"
    t.string "note"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_trade_wallet_frozens_on_item_id"
    t.index ["operator_id"], name: "index_trade_wallet_frozens_on_operator_id"
    t.index ["wallet_id"], name: "index_trade_wallet_frozens_on_wallet_id"
  end

  create_table "trade_wallet_goods", force: :cascade do |t|
    t.bigint "wallet_template_id"
    t.string "good_type"
    t.bigint "good_id"
    t.string "wallet_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_type", "good_id"], name: "index_trade_wallet_goods_on_good"
    t.index ["wallet_template_id"], name: "index_trade_wallet_goods_on_wallet_template_id"
  end

  create_table "trade_wallet_logs", force: :cascade do |t|
    t.bigint "wallet_id"
    t.string "source_type"
    t.bigint "source_id"
    t.string "title"
    t.string "tag_str"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_type", "source_id"], name: "index_trade_wallet_logs_on_source"
    t.index ["wallet_id"], name: "index_trade_wallet_logs_on_wallet_id"
  end

  create_table "trade_wallet_prepayments", force: :cascade do |t|
    t.bigint "wallet_template_id"
    t.string "token"
    t.decimal "amount"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "lawful"
    t.index ["wallet_template_id"], name: "index_trade_wallet_prepayments_on_wallet_template_id"
  end

  create_table "trade_wallet_sells", force: :cascade do |t|
    t.bigint "operator_id"
    t.bigint "wallet_id"
    t.bigint "item_id"
    t.string "selled_type"
    t.bigint "selled_id"
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

  create_table "trade_wallet_templates", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "name"
    t.string "description"
    t.integer "wallets_count", default: 0
    t.string "code"
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unit_name"
    t.string "rate", comment: "相对于默认货币的比率"
    t.string "unit"
    t.integer "digit"
    t.boolean "enabled", default: true
    t.string "appid", comment: "推广微信公众号"
    t.index ["organ_id"], name: "index_trade_wallet_templates_on_organ_id"
  end

  create_table "trade_wallets", force: :cascade do |t|
    t.bigint "wallet_template_id"
    t.decimal "amount", default: "0.0"
    t.decimal "withdrawable_amount", comment: "可提现的额度"
    t.decimal "income_amount", default: "0.0"
    t.decimal "expense_amount", default: "0.0"
    t.string "account_bank"
    t.string "account_name"
    t.string "account_number"
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "member_organ_id"
    t.bigint "client_id"
    t.string "name"
    t.string "type"
    t.decimal "advances_amount"
    t.decimal "sells_amount"
    t.decimal "frozen_amount", comment: "支出：冻结金额"
    t.decimal "payout_amount", comment: "支出：提现"
    t.decimal "payment_amount", comment: "支出：钱包支付"
    t.bigint "contact_id"
    t.bigint "agent_id"
    t.decimal "refunded_amount", comment: "收入：退款"
    t.index ["agent_id"], name: "index_trade_wallets_on_agent_id"
    t.index ["client_id"], name: "index_trade_wallets_on_client_id"
    t.index ["contact_id"], name: "index_trade_wallets_on_contact_id"
    t.index ["member_id"], name: "index_trade_wallets_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_wallets_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_wallets_on_organ_id"
    t.index ["user_id"], name: "index_trade_wallets_on_user_id"
    t.index ["wallet_template_id"], name: "index_trade_wallets_on_wallet_template_id"
  end

  create_table "wechat_agents", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "jsapi_ticket"
    t.datetime "jsapi_ticket_expires_at"
    t.string "name"
    t.boolean "inviting", comment: "可邀请加入"
    t.string "corpid"
    t.string "secret"
    t.string "token"
    t.string "agentid"
    t.string "encoding_aes_key"
    t.string "user_name"
    t.string "domain"
    t.string "url_link"
    t.boolean "debug"
    t.string "confirm_name"
    t.string "confirm_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_wechat_agents_on_organ_id"
  end

  create_table "wechat_app_configs", force: :cascade do |t|
    t.string "appid"
    t.string "value"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_app_configs_on_appid"
  end

  create_table "wechat_app_menus", force: :cascade do |t|
    t.bigint "scene_id"
    t.bigint "tag_id"
    t.bigint "menu_id"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_wechat_app_menus_on_menu_id"
    t.index ["scene_id"], name: "index_wechat_app_menus_on_scene_id"
    t.index ["tag_id"], name: "index_wechat_app_menus_on_tag_id"
  end

  create_table "wechat_app_payees", force: :cascade do |t|
    t.string "appid"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mch_id"
    t.boolean "enabled"
    t.index ["appid"], name: "index_wechat_app_payees_on_appid"
  end

  create_table "wechat_apps", force: :cascade do |t|
    t.bigint "platform_id"
    t.string "appid"
    t.string "access_token"
    t.datetime "access_token_expires_at", precision: nil
    t.string "refresh_token"
    t.string "func_infos", array: true
    t.string "nick_name"
    t.string "head_img"
    t.string "user_name"
    t.string "principal_name"
    t.string "alias_name"
    t.string "qrcode_url"
    t.json "business_info"
    t.string "service_type"
    t.string "verify_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "platform_template_id"
    t.string "type"
    t.jsonb "extra"
    t.integer "auditid"
    t.jsonb "version_info"
    t.integer "audit_status"
    t.string "confirm_name"
    t.string "confirm_content"
    t.bigint "organ_id"
    t.string "ticket"
    t.string "logo_media_id"
    t.string "jsapi_ticket"
    t.datetime "jsapi_ticket_expires_at"
    t.boolean "enabled"
    t.boolean "global"
    t.text "secret"
    t.string "token"
    t.boolean "encrypt_mode"
    t.string "encoding_aes_key"
    t.string "url_link"
    t.boolean "debug"
    t.string "weapp_id", comment: "关联的小程序"
    t.string "open_appid"
    t.string "webview_domain"
    t.string "platform_appid"
    t.string "oauth_domain"
    t.string "webview_domain_registered", array: true
    t.index ["organ_id"], name: "index_wechat_apps_on_organ_id"
    t.index ["platform_id"], name: "index_wechat_apps_on_platform_id"
    t.index ["platform_template_id"], name: "index_wechat_apps_on_platform_template_id"
  end

  create_table "wechat_auths", force: :cascade do |t|
    t.bigint "platform_id"
    t.string "auth_code"
    t.datetime "auth_code_expires_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_id"
    t.boolean "testcase"
    t.index ["platform_id"], name: "index_wechat_auths_on_platform_id"
    t.index ["request_id"], name: "index_wechat_auths_on_request_id"
  end

  create_table "wechat_categories", force: :cascade do |t|
    t.bigint "parent_id"
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

  create_table "wechat_category_hierarchies", force: :cascade do |t|
    t.bigint "ancestor_id"
    t.bigint "descendant_id"
    t.integer "generations", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "wechat/category_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_wechat_category_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_wechat_category_hierarchies_on_descendant_id"
  end

  create_table "wechat_contacts", force: :cascade do |t|
    t.string "corpid"
    t.string "userid"
    t.string "part_id"
    t.string "config_id"
    t.string "qr_code"
    t.string "remark"
    t.string "state"
    t.boolean "skip_verify", default: true
    t.string "suite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_corp_external_users", force: :cascade do |t|
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

  create_table "wechat_corp_users", force: :cascade do |t|
    t.string "corpid"
    t.string "device_id"
    t.string "user_ticket"
    t.datetime "ticket_expires_at"
    t.string "open_userid"
    t.string "open_id"
    t.string "identity"
    t.string "name"
    t.string "gender"
    t.string "avatar_url"
    t.string "qr_code"
    t.integer "department", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suite_id"
    t.integer "follows_count", default: 0
    t.bigint "organ_id"
    t.string "userid"
    t.index ["corpid"], name: "index_wechat_corp_users_on_corpid"
    t.index ["organ_id"], name: "index_wechat_corp_users_on_organ_id"
  end

  create_table "wechat_corps", force: :cascade do |t|
    t.string "name"
    t.string "corpid"
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
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "jsapi_ticket"
    t.datetime "jsapi_ticket_expires_at"
    t.string "permanent_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suite_id"
    t.string "token"
    t.string "encoding_aes_key"
    t.string "agent_ticket"
    t.datetime "agent_ticket_expires_at"
    t.boolean "debug"
    t.bigint "organ_id"
    t.string "open_corpid"
    t.boolean "inviting", comment: "可邀请加入"
    t.string "user_name"
    t.string "domain"
    t.string "url_link"
    t.string "confirm_name"
    t.string "confirm_content"
    t.string "type"
    t.string "agentid"
    t.string "secret"
    t.index ["corpid"], name: "index_wechat_corps_on_corpid"
    t.index ["organ_id"], name: "index_wechat_corps_on_organ_id"
  end

  create_table "wechat_developers", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.string "encoding_aes_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_externals", force: :cascade do |t|
    t.string "corp_id"
    t.string "external_userid"
    t.string "name"
    t.string "position"
    t.string "avatar"
    t.string "corp_name"
    t.string "corp_full_name"
    t.string "external_type"
    t.string "gender"
    t.string "unionid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_extractions", force: :cascade do |t|
    t.bigint "extractor_id"
    t.string "name"
    t.string "matched"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_id"
    t.integer "serial_number"
    t.index ["extractor_id"], name: "index_wechat_extractions_on_extractor_id"
    t.index ["request_id"], name: "index_wechat_extractions_on_request_id"
  end

  create_table "wechat_extractors", force: :cascade do |t|
    t.string "name"
    t.string "prefix"
    t.string "suffix"
    t.boolean "more"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "serial"
    t.integer "serial_start"
    t.time "start_at"
    t.time "finish_at"
    t.string "valid_response"
    t.string "invalid_response"
    t.bigint "response_id"
    t.index ["response_id"], name: "index_wechat_extractors_on_response_id"
  end

  create_table "wechat_follows", force: :cascade do |t|
    t.string "userid"
    t.string "remark"
    t.string "description"
    t.string "state"
    t.string "oper_userid"
    t.string "add_way"
    t.string "corp_id"
    t.string "external_userid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_hooks", force: :cascade do |t|
    t.bigint "response_id"
    t.string "hooked_type"
    t.bigint "hooked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hooked_type", "hooked_id"], name: "index_wechat_hooks_on_hooked"
    t.index ["response_id"], name: "index_wechat_hooks_on_response_id"
  end

  create_table "wechat_medias", force: :cascade do |t|
    t.bigint "user_id"
    t.string "source_type"
    t.bigint "source_id"
    t.string "attachment_name"
    t.string "media_id"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_type", "source_id"], name: "index_wechat_medias_on_source"
    t.index ["user_id"], name: "index_wechat_medias_on_user_id"
  end

  create_table "wechat_menu_apps", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "scene_id"
    t.bigint "tag_id"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "menu_root_id"
    t.bigint "menu_root_app_id"
    t.string "type"
    t.string "name"
    t.string "value"
    t.string "mp_appid"
    t.string "mp_pagepath"
    t.integer "position"
    t.index ["appid"], name: "index_wechat_menu_apps_on_appid"
    t.index ["menu_id"], name: "index_wechat_menu_apps_on_menu_id"
    t.index ["menu_root_app_id"], name: "index_wechat_menu_apps_on_menu_root_app_id"
    t.index ["menu_root_id"], name: "index_wechat_menu_apps_on_menu_root_id"
    t.index ["scene_id"], name: "index_wechat_menu_apps_on_scene_id"
    t.index ["tag_id"], name: "index_wechat_menu_apps_on_tag_id"
  end

  create_table "wechat_menu_disables", force: :cascade do |t|
    t.bigint "menu_id"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_menu_disables_on_appid"
    t.index ["menu_id"], name: "index_wechat_menu_disables_on_menu_id"
  end

  create_table "wechat_menu_root_apps", force: :cascade do |t|
    t.bigint "menu_root_id"
    t.string "name"
    t.string "appid"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_root_id"], name: "index_wechat_menu_root_apps_on_menu_root_id"
  end

  create_table "wechat_menu_roots", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_menus", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.string "mp_appid"
    t.string "mp_pagepath"
    t.bigint "menu_root_id"
    t.index ["menu_root_id"], name: "index_wechat_menus_on_menu_root_id"
  end

  create_table "wechat_messages", force: :cascade do |t|
    t.bigint "platform_id"
    t.string "appid"
    t.string "open_id"
    t.string "msg_id"
    t.string "msg_type"
    t.string "content"
    t.string "encrypt_data"
    t.json "message_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "msg_format", default: "xml"
    t.string "info_type"
    t.string "type"
    t.index ["appid"], name: "index_wechat_messages_on_appid"
    t.index ["open_id"], name: "index_wechat_messages_on_open_id"
    t.index ["platform_id"], name: "index_wechat_messages_on_platform_id"
  end

  create_table "wechat_news_reply_items", force: :cascade do |t|
    t.bigint "news_reply_id"
    t.string "title"
    t.string "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "raw_pic_url"
    t.index ["news_reply_id"], name: "index_wechat_news_reply_items_on_news_reply_id"
  end

  create_table "wechat_notices", force: :cascade do |t|
    t.bigint "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "notification_id"
    t.string "link", default: "index"
    t.string "msg_id"
    t.string "status"
    t.string "type"
    t.string "appid"
    t.string "open_id"
    t.bigint "msg_request_id"
    t.jsonb "result"
    t.index ["msg_request_id"], name: "index_wechat_notices_on_msg_request_id"
    t.index ["notification_id"], name: "index_wechat_notices_on_notification_id"
    t.index ["template_id"], name: "index_wechat_notices_on_template_id"
  end

  create_table "wechat_partners", force: :cascade do |t|
    t.string "name"
    t.string "appid", comment: "sp_appid"
    t.string "mch_id", comment: "支付专用、商户号"
    t.text "key"
    t.text "key_v3"
    t.string "serial_no"
    t.text "apiclient_cert"
    t.text "apiclient_key"
    t.datetime "platform_effective_at"
    t.datetime "platform_expire_at"
    t.string "platform_serial_no"
    t.jsonb "encrypt_certificate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_payee_apps", force: :cascade do |t|
    t.string "mch_id"
    t.string "appid"
    t.boolean "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id"
    t.index ["appid"], name: "index_wechat_payee_apps_on_appid"
    t.index ["mch_id"], name: "index_wechat_payee_apps_on_mch_id"
    t.index ["organ_id"], name: "index_wechat_payee_apps_on_organ_id"
  end

  create_table "wechat_payee_domains", force: :cascade do |t|
    t.string "mch_id"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain"], name: "index_wechat_payee_domains_on_domain"
    t.index ["mch_id"], name: "index_wechat_payee_domains_on_mch_id"
  end

  create_table "wechat_payees", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "mch_id", comment: "支付专用、商户号"
    t.text "key"
    t.text "key_v3"
    t.string "serial_no"
    t.text "apiclient_cert"
    t.text "apiclient_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "platform_effective_at"
    t.datetime "platform_expire_at"
    t.string "platform_serial_no"
    t.jsonb "encrypt_certificate"
    t.bigint "partner_id"
    t.string "type"
    t.string "name"
    t.index ["organ_id"], name: "index_wechat_payees_on_organ_id"
    t.index ["partner_id"], name: "index_wechat_payees_on_partner_id"
  end

  create_table "wechat_platform_templates", force: :cascade do |t|
    t.bigint "platform_id"
    t.string "user_version"
    t.string "user_desc"
    t.integer "template_id"
    t.integer "audit_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_wechat_platform_templates_on_platform_id"
  end

  create_table "wechat_platform_tickets", force: :cascade do |t|
    t.string "signature"
    t.integer "timestamp"
    t.string "nonce"
    t.string "msg_signature"
    t.string "appid"
    t.string "ticket_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "message_hash"
    t.string "info_type"
  end

  create_table "wechat_platforms", force: :cascade do |t|
    t.string "name"
    t.string "appid"
    t.string "secret"
    t.string "token"
    t.string "encoding_aes_key"
    t.string "verify_ticket"
    t.string "access_token"
    t.datetime "access_token_expires_at", precision: nil
    t.string "pre_auth_code"
    t.datetime "pre_auth_code_expires_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "domain"
    t.bigint "public_agency_id"
    t.bigint "program_agency_id"
    t.index ["program_agency_id"], name: "index_wechat_platforms_on_program_agency_id"
    t.index ["public_agency_id"], name: "index_wechat_platforms_on_public_agency_id"
  end

  create_table "wechat_provider_organs", force: :cascade do |t|
    t.bigint "provider_id"
    t.string "corpid"
    t.string "open_corpid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_wechat_provider_organs_on_provider_id"
  end

  create_table "wechat_provider_receives", force: :cascade do |t|
    t.bigint "provider_id"
    t.string "corp_id"
    t.string "user_id"
    t.string "agent_id"
    t.string "msg_id"
    t.string "msg_type"
    t.string "event"
    t.string "event_key"
    t.string "content"
    t.string "encrypt_data"
    t.jsonb "message_hash"
    t.string "msg_format", default: "xml"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corp_id"], name: "index_wechat_provider_receives_on_corp_id"
    t.index ["provider_id"], name: "index_wechat_provider_receives_on_provider_id"
    t.index ["user_id"], name: "index_wechat_provider_receives_on_user_id"
  end

  create_table "wechat_provider_tickets", force: :cascade do |t|
    t.integer "timestamp"
    t.string "nonce"
    t.string "msg_signature"
    t.string "suite_id"
    t.string "ticket_data"
    t.string "agent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "message_hash"
    t.string "info_type"
  end

  create_table "wechat_providers", force: :cascade do |t|
    t.string "name"
    t.string "corp_id"
    t.string "provider_secret"
    t.string "token"
    t.string "encoding_aes_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_token"
    t.datetime "access_token_expires_at"
  end

  create_table "wechat_qy_medias", force: :cascade do |t|
    t.string "medium_type"
    t.bigint "medium_id"
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

  create_table "wechat_receivers", force: :cascade do |t|
    t.string "account"
    t.string "name"
    t.string "custom_relation"
    t.jsonb "res"
    t.string "receiver_type"
    t.string "relation_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "app_payee_id"
    t.index ["app_payee_id"], name: "index_wechat_receivers_on_app_payee_id"
  end

  create_table "wechat_registers", force: :cascade do |t|
    t.string "id_name"
    t.string "id_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state", default: "init"
    t.string "appid"
    t.bigint "user_id"
    t.bigint "organ_id"
    t.string "email_code"
    t.string "password"
    t.string "mobile"
    t.string "mobile_code"
    t.string "personal_wechat"
    t.string "organ_name"
    t.string "organ_code"
    t.index ["organ_id"], name: "index_wechat_registers_on_organ_id"
    t.index ["user_id"], name: "index_wechat_registers_on_user_id"
  end

  create_table "wechat_replies", force: :cascade do |t|
    t.string "messaging_type"
    t.bigint "messaging_id"
    t.string "type"
    t.string "value"
    t.json "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "description"
    t.string "appid"
    t.bigint "platform_id"
    t.bigint "request_id"
    t.bigint "message_send_id"
    t.string "open_id"
    t.string "nonce"
    t.index ["message_send_id"], name: "index_wechat_replies_on_message_send_id"
    t.index ["messaging_type", "messaging_id"], name: "index_wechat_replies_on_messaging_type_and_messaging_id"
    t.index ["platform_id"], name: "index_wechat_replies_on_platform_id"
    t.index ["request_id"], name: "index_wechat_replies_on_request_id"
  end

  create_table "wechat_request_responses", force: :cascade do |t|
    t.bigint "response_id"
    t.string "request_type"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_wechat_request_responses_on_response_id"
  end

  create_table "wechat_requests", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "msg_type"
    t.string "event"
    t.string "event_key"
    t.jsonb "raw_body"
    t.string "appid"
    t.string "open_id"
    t.bigint "receive_id"
    t.jsonb "reply_body"
    t.datetime "sent_at"
    t.string "userid"
    t.bigint "scene_organ_id"
    t.string "aim"
    t.string "tag_name"
    t.integer "handle_id"
    t.bigint "platform_id"
    t.index ["platform_id"], name: "index_wechat_requests_on_platform_id"
    t.index ["receive_id"], name: "index_wechat_requests_on_receive_id"
    t.index ["scene_organ_id"], name: "index_wechat_requests_on_scene_organ_id"
  end

  create_table "wechat_responses", force: :cascade do |t|
    t.string "match_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expire_at", precision: nil
    t.boolean "contain", default: true
    t.string "appid"
    t.boolean "enabled", default: true
    t.bigint "reply_id"
    t.index ["reply_id"], name: "index_wechat_responses_on_reply_id"
  end

  create_table "wechat_scene_menus", force: :cascade do |t|
    t.bigint "scene_id"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tag_id"
    t.index ["menu_id"], name: "index_wechat_scene_menus_on_menu_id"
    t.index ["scene_id"], name: "index_wechat_scene_menus_on_scene_id"
    t.index ["tag_id"], name: "index_wechat_scene_menus_on_tag_id"
  end

  create_table "wechat_scenes", force: :cascade do |t|
    t.bigint "organ_id"
    t.string "match_value"
    t.integer "expire_seconds"
    t.datetime "expire_at", precision: nil
    t.string "qrcode_ticket"
    t.string "qrcode_url"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "menu_id"
    t.string "aim"
    t.string "handle_type"
    t.bigint "handle_id"
    t.string "tag_name"
    t.string "env_version"
    t.string "note"
    t.string "state_uuid"
    t.index ["appid"], name: "index_wechat_scenes_on_appid"
    t.index ["handle_type", "handle_id"], name: "index_wechat_scenes_on_handle"
    t.index ["organ_id"], name: "index_wechat_scenes_on_organ_id"
  end

  create_table "wechat_services", force: :cascade do |t|
    t.bigint "request_id"
    t.string "type"
    t.string "msgtype"
    t.string "value"
    t.string "appid"
    t.string "open_id"
    t.json "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_wechat_services_on_request_id"
  end

  create_table "wechat_subscribes", force: :cascade do |t|
    t.bigint "wechat_user_id"
    t.bigint "template_id"
    t.datetime "sending_at", precision: nil
    t.string "status", default: "accept"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_wechat_subscribes_on_template_id"
    t.index ["wechat_user_id"], name: "index_wechat_subscribes_on_wechat_user_id"
  end

  create_table "wechat_suite_receives", force: :cascade do |t|
    t.bigint "provider_id"
    t.string "user_id"
    t.string "agent_id"
    t.string "msg_id"
    t.string "msg_type"
    t.string "event"
    t.string "event_key"
    t.string "encrypt_data"
    t.jsonb "message_hash"
    t.string "msg_format", default: "xml"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suiteid"
    t.string "corpid"
    t.string "auth_corp_id"
    t.string "info_type"
    t.index ["provider_id"], name: "index_wechat_suite_receives_on_provider_id"
    t.index ["user_id"], name: "index_wechat_suite_receives_on_user_id"
  end

  create_table "wechat_suite_tickets", force: :cascade do |t|
    t.string "ticket_data"
    t.string "agent_id"
    t.jsonb "message_hash"
    t.string "info_type"
    t.string "auth_corp_id"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suiteid"
    t.string "corpid"
    t.string "to"
  end

  create_table "wechat_suites", force: :cascade do |t|
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
    t.string "redirect_action", default: "index", comment: "默认跳转"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
  end

  create_table "wechat_supporters", force: :cascade do |t|
    t.string "avatar"
    t.string "name"
    t.string "open_kfid"
    t.boolean "manage_privilege"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "corp_id"
    t.string "corpid"
    t.index ["corp_id"], name: "index_wechat_supporters_on_corp_id"
  end

  create_table "wechat_tags", force: :cascade do |t|
    t.string "name"
    t.string "tag_id"
    t.integer "count"
    t.integer "user_tags_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_tag_id"
    t.string "tagging_type"
    t.bigint "tagging_id"
    t.string "appid"
    t.string "kind"
    t.index ["tagging_type", "tagging_id"], name: "index_wechat_tags_on_tagging_type_and_tagging_id"
    t.index ["user_tag_id"], name: "index_wechat_tags_on_user_tag_id"
  end

  create_table "wechat_template_configs", force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.string "tid"
    t.string "description"
    t.string "notifiable_type"
    t.string "code", default: "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content"
  end

  create_table "wechat_template_key_words", force: :cascade do |t|
    t.bigint "template_config_id"
    t.integer "position"
    t.integer "kid"
    t.string "name"
    t.string "example"
    t.string "rule"
    t.string "mapping"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.index ["template_config_id"], name: "index_wechat_template_key_words_on_template_config_id"
  end

  create_table "wechat_templates", force: :cascade do |t|
    t.string "appid"
    t.string "template_id"
    t.string "title"
    t.string "content"
    t.string "example"
    t.integer "template_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "template_kind"
    t.index ["appid"], name: "index_wechat_templates_on_appid"
  end

  create_table "wechat_user_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_tagged_id"
    t.string "appid"
    t.string "tag_name"
    t.string "open_id"
    t.bigint "member_inviter_id"
    t.boolean "synced", default: false
    t.index ["member_inviter_id"], name: "index_wechat_user_tags_on_member_inviter_id"
    t.index ["user_tagged_id"], name: "index_wechat_user_tags_on_user_tagged_id"
  end

  add_foreign_key "solid_queue_blocked_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_claimed_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_failed_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_ready_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_recurring_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_scheduled_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
end
