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

ActiveRecord::Schema[8.2].define(version: 2026_06_23_095218) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "doc_maps", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "mappings"
    t.string "name"
    t.datetime "updated_at", null: false
    t.string "xx"
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
    t.datetime "updated_at", null: false
    t.string "markdown"
    t.string "title"
    t.string "html"
    t.string "controller_path"
    t.string "action_name"
    t.jsonb "request_comments"
    t.jsonb "response_comments"
    t.datetime "synced_at"
  end

  create_table "meta_actions", force: :cascade do |t|
    t.string "namespace_identifier", null: false
    t.string "business_identifier", null: false
    t.string "controller_path", null: false
    t.string "controller_name", null: false
    t.string "action_name", null: false
    t.string "identifier"
    t.string "path"
    t.string "verb"
    t.integer "position"
    t.boolean "landmark"
    t.datetime "synced_at"
    t.boolean "testable"
    t.string "request_as"
    t.string "required_parts", array: true
    t.string "operation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meta_businesses", force: :cascade do |t|
    t.string "name"
    t.string "identifier", null: false
    t.integer "position"
    t.datetime "synced_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meta_columns", force: :cascade do |t|
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
  end

  create_table "meta_controllers", force: :cascade do |t|
    t.string "namespace_identifier", null: false
    t.string "business_identifier", null: false
    t.string "controller_path", null: false
    t.string "controller_name", null: false
    t.datetime "synced_at"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meta_namespaces", force: :cascade do |t|
    t.string "name"
    t.string "identifier", null: false
    t.boolean "verify_organ"
    t.boolean "verify_member"
    t.boolean "verify_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meta_operations", force: :cascade do |t|
    t.string "action_name"
    t.string "operation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meta_records", force: :cascade do |t|
    t.string "name"
    t.string "record_name"
    t.string "table_name"
    t.string "description"
    t.boolean "defined_db"
    t.boolean "customizable", comment: "是否允许用户定制"
    t.string "business_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
