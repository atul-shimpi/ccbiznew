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

ActiveRecord::Schema.define(version: 20160326135154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "phone"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "issuperadmin"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "auctions", force: :cascade do |t|
    t.string   "name"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "auctions", ["shop_id"], name: "index_auctions_on_shop_id", using: :btree

  create_table "auctions_skills", id: false, force: :cascade do |t|
    t.integer "auction_id", null: false
    t.integer "skill_id",   null: false
  end

  create_table "business_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "phone"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
  end

  add_index "business_users", ["email"], name: "index_business_users_on_email", unique: true, using: :btree
  add_index "business_users", ["reset_password_token"], name: "index_business_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "contactname"
    t.string   "contactemail"
    t.string   "contactnumber"
    t.text     "contactinfo"
    t.decimal  "shoprating"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "shop_id"
  end

  add_index "contacts", ["shop_id"], name: "index_contacts_on_shop_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "venue"
    t.string   "photo"
    t.string   "discription"
    t.datetime "event_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "shop_id"
  end

  add_index "events", ["shop_id"], name: "index_events_on_shop_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "alt",        default: ""
    t.string   "hint",       default: ""
    t.string   "file"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "status"
    t.string   "brand"
    t.string   "product"
    t.string   "discount"
    t.integer  "shop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "player_skills", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "player_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "player_skills", ["player_id"], name: "index_player_skills_on_player_id", using: :btree
  add_index "player_skills", ["skill_id"], name: "index_player_skills_on_skill_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "age"
    t.decimal  "baseprice"
    t.decimal  "auctionprice"
    t.integer  "team_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "auction_id"
    t.string   "image"
    t.text     "description"
    t.boolean  "is_captain"
  end

  add_index "players", ["auction_id"], name: "index_players_on_auction_id", using: :btree
  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "seodetails", force: :cascade do |t|
    t.text     "title"
    t.text     "metakeywords"
    t.text     "metadescription"
    t.integer  "shop_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "pagename"
  end

  add_index "seodetails", ["shop_id"], name: "index_seodetails_on_shop_id", using: :btree

  create_table "shop_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.text     "address"
    t.text     "info"
    t.integer  "business_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "avatar"
    t.integer  "category_id"
    t.string   "template"
    t.string   "subdomain"
    t.integer  "admin_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "google"
    t.string   "twitter"
    t.integer  "shoptype"
    t.text     "metakeywords"
    t.text     "metadescription"
    t.text     "googleanalytics"
    t.integer  "isactive"
    t.string   "backgroundimage"
    t.string   "pagetitle"
    t.string   "domain"
  end

  create_table "single_business_users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "phone"
    t.string   "pannumber"
    t.string   "votingid"
    t.string   "adharid"
    t.text     "skills"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "avatar"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "auction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skills", ["auction_id"], name: "index_skills_on_auction_id", using: :btree

  create_table "teamowners", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "photo"
    t.integer  "team_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "teamowners", ["team_id"], name: "index_teamowners_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.decimal  "points"
    t.integer  "auction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["auction_id"], name: "index_teams_on_auction_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "user_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "auctions", "shops"
  add_foreign_key "contacts", "shops"
  add_foreign_key "events", "shops"
  add_foreign_key "players", "auctions"
  add_foreign_key "players", "teams"
  add_foreign_key "seodetails", "shops"
  add_foreign_key "skills", "auctions"
  add_foreign_key "teamowners", "teams"
  add_foreign_key "teams", "auctions"
end
