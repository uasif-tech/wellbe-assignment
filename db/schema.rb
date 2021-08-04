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

ActiveRecord::Schema.define(version: 2021_08_02_110702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "task_assignments", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "task_id", null: false
    t.bigint "task_item_id", null: false
    t.date "due_date"
    t.boolean "is_completed", default: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_task_assignments_on_patient_id"
    t.index ["task_id"], name: "index_task_assignments_on_task_id"
    t.index ["task_item_id"], name: "index_task_assignments_on_task_item_id"
  end

  create_table "task_items", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.string "due_days"
    t.bigint "task_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_id"], name: "index_task_items_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_name"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "task_assignments", "patients"
  add_foreign_key "task_assignments", "task_items"
  add_foreign_key "task_assignments", "tasks"
  add_foreign_key "task_items", "tasks"
end
