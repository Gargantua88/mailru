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

ActiveRecord::Schema.define(version: 2020_01_25_173326) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "start_time", null: false
    t.integer "course_id"
    t.index ["course_id"], name: "index_groups_on_course_id"
    t.index ["start_time"], name: "index_groups_on_start_time", unique: true
  end

  create_table "groups_students", force: :cascade do |t|
    t.integer "group_id"
    t.integer "student_id"
    t.index ["group_id"], name: "index_groups_students_on_group_id"
    t.index ["student_id"], name: "index_groups_students_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
  end

end
