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

ActiveRecord::Schema[8.1].define(version: 2026_04_02_121011) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "authors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "first_name"
    t.string "second_name"
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.boolean "active", default: true
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.boolean "loaned", default: false, null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "loans", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.date "date_borrowed"
    t.date "date_due"
    t.bigint "student_id", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_loans_on_book_id"
    t.index ["student_id"], name: "index_loans_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.string "email"
    t.string "first_name"
    t.string "phone"
    t.string "school_id"
    t.string "second_name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books", "authors"
  add_foreign_key "loans", "books"
  add_foreign_key "loans", "students"
end
