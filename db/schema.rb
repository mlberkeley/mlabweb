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

ActiveRecord::Schema.define(version: 20170113193422) do

  create_table "blogposts", force: :cascade do |t|
    t.text     "content"
    t.boolean  "published",  default: false
    t.integer  "member_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "title",      default: "Title"
    t.string   "picture"
    t.bigint   "views",      default: 0
    t.index ["member_id", "created_at"], name: "index_blogposts_on_member_id_and_created_at"
    t.index ["member_id"], name: "index_blogposts_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "exec",              default: false
    t.boolean  "admin",             default: false
    t.string   "position",          default: "Project Member"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.text     "introduction",      default: "I love Machine Learning At Berkeley"
    t.string   "picture"
    t.boolean  "officer",           default: false
    t.string   "major",             default: "Agriculture"
    t.string   "grade",             default: "Freshman"
    t.index ["email"], name: "index_members_on_email", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "tag"
    t.text     "description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "picture"
    t.boolean  "current",     default: true
  end

  create_table "specials", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tag"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_subscribers_on_email", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "project_id"
    t.integer  "year"
    t.string   "semester"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_teams_on_member_id"
    t.index ["project_id"], name: "index_teams_on_project_id"
  end

end
