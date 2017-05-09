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

ActiveRecord::Schema.define(version: 20170426171920) do

  create_table "distractors", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "body"
    t.text     "notes"
    t.boolean  "correct"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_distractors_on_question_id"
  end

  create_table "question_slots_quiz", force: :cascade do |t|
    t.integer "slot_id"
    t.integer "question_id"
    t.integer "quiz_id"
    t.index ["question_id"], name: "index_question_slots_quiz_on_question_id"
    t.index ["quiz_id"], name: "index_question_slots_quiz_on_quiz_id"
    t.index ["slot_id", "question_id"], name: "index_question_slots_quiz_on_slot_id_and_question_id", unique: true
    t.index ["slot_id", "quiz_id"], name: "index_question_slots_quiz_on_slot_id_and_quiz_id", unique: true
    t.index ["slot_id"], name: "index_question_slots_quiz_on_slot_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "body"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "description"
    t.text     "notes"
    t.float    "passing_grade"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "slots", force: :cascade do |t|
    t.integer  "order",      limit: 3
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 1073741823
    t.datetime "created_at"
    t.integer  "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

end
