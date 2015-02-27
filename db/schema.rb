# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150226230424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_votes", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "vote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answer_votes", ["answer_id"], name: "index_answer_votes_on_answer_id", using: :btree
  add_index "answer_votes", ["vote_id"], name: "index_answer_votes_on_vote_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.text     "description", null: false
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["answer_id"], name: "index_comments_on_answer_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "question_tags", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "tag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_tags", ["question_id"], name: "index_question_tags_on_question_id", using: :btree
  add_index "question_tags", ["tag_id"], name: "index_question_tags_on_tag_id", using: :btree

  create_table "question_votes", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "vote_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_votes", ["question_id"], name: "index_question_votes_on_question_id", using: :btree
  add_index "question_votes", ["vote_id"], name: "index_question_votes_on_vote_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.integer  "view_count"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "vote_value"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
