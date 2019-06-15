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

ActiveRecord::Schema.define(version: 2019_06_13_204849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "work_order_id"
    t.bigint "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_order_id"], name: "index_assignments_on_work_order_id"
    t.index ["worker_id"], name: "index_assignments_on_worker_id"
  end

  create_table "work_orders", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.date "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade do |t|
    t.text "name"
    t.text "company_name"
    t.text "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assignments", "work_orders"
  add_foreign_key "assignments", "workers"
end
