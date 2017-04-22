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

ActiveRecord::Schema.define(version: 20161206093729) do

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
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "startdatetime"
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
    t.integer  "storeuserid"
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

  create_table "customers", force: :cascade do |t|
    t.string   "email"
    t.text     "description"
    t.integer  "subscription_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "credit_card_number"
    t.integer  "credit_card_expiry_month"
    t.integer  "credit_card_expiry_year"
    t.string   "credit_card_token"
    t.date     "good_until"
  end

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

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "jackpot_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jackpot_users", ["authentication_token"], name: "index_jackpot_users_on_authentication_token", unique: true, using: :btree
  add_index "jackpot_users", ["email"], name: "index_jackpot_users_on_email", unique: true, using: :btree
  add_index "jackpot_users", ["reset_password_token"], name: "index_jackpot_users_on_reset_password_token", unique: true, using: :btree

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

  create_table "paymentnotifications", force: :cascade do |t|
    t.text     "description"
    t.integer  "payment_id"
    t.integer  "site_user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "paymentnotifications", ["payment_id"], name: "index_paymentnotifications_on_payment_id", using: :btree
  add_index "paymentnotifications", ["site_user_id"], name: "index_paymentnotifications_on_site_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "payment_transaction_token"
    t.integer  "amount"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer_name"
    t.integer  "subscription_id"
    t.integer  "customer_id"
    t.string   "public_token"
    t.integer  "site_user_id"
    t.integer  "status"
  end

  add_index "payments", ["public_token"], name: "index_payments_on_public_token", using: :btree
  add_index "payments", ["site_user_id"], name: "index_payments_on_site_user_id", using: :btree

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

  create_table "rapidfire_answer_groups", force: :cascade do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rapidfire_answer_groups", ["survey_id"], name: "index_rapidfire_answer_groups_on_survey_id", using: :btree
  add_index "rapidfire_answer_groups", ["user_id", "user_type"], name: "index_rapidfire_answer_groups_on_user_id_and_user_type", using: :btree

  create_table "rapidfire_answers", force: :cascade do |t|
    t.integer  "answer_group_id"
    t.integer  "question_id"
    t.text     "answer_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rapidfire_answers", ["answer_group_id"], name: "index_rapidfire_answers_on_answer_group_id", using: :btree
  add_index "rapidfire_answers", ["question_id"], name: "index_rapidfire_answers_on_question_id", using: :btree

  create_table "rapidfire_questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.string   "type"
    t.string   "question_text"
    t.integer  "position"
    t.text     "answer_options"
    t.text     "validation_rules"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rapidfire_questions", ["survey_id"], name: "index_rapidfire_questions_on_survey_id", using: :btree

  create_table "rapidfire_surveys", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seodetails", force: :cascade do |t|
    t.text     "title"
    t.text     "metakeywords"
    t.text     "metadescription"
    t.integer  "shop_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "pagename"
    t.string   "pagealias"
    t.text     "pagecontent"
    t.integer  "parentpage"
    t.text     "headerbg"
    t.text     "footerbg"
    t.boolean  "extrapage"
    t.text     "htmldata"
    t.integer  "ishomepage"
    t.integer  "isinmenu"
    t.integer  "isglobalheader"
    t.integer  "isglobalfooter"
    t.string   "slug"
    t.integer  "pageorder"
  end

  add_index "seodetails", ["shop_id"], name: "index_seodetails_on_shop_id", using: :btree

  create_table "shop_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "imagetype"
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.text     "address"
    t.text     "info"
    t.integer  "business_user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
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
    t.text     "homecontent"
    t.string   "addressname"
    t.text     "buildingname"
    t.text     "blockno"
    t.integer  "gallerytype"
    t.integer  "storeid"
    t.boolean  "loginenabled"
    t.text     "headerbg"
    t.text     "footerbg"
    t.text     "headerhtml"
    t.text     "footerhtml"
    t.text     "recieptheaderhtml"
    t.text     "recieptfooterhtml"
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

  create_table "site_user_fields", force: :cascade do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "isreceipt"
    t.boolean  "isintable"
  end

  add_index "site_user_fields", ["shop_id"], name: "index_site_user_fields_on_shop_id", using: :btree

  create_table "site_users", force: :cascade do |t|
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
    t.integer  "shop_id"
    t.text     "properties"
  end

  add_index "site_users", ["email"], name: "index_site_users_on_email", unique: true, using: :btree
  add_index "site_users", ["reset_password_token"], name: "index_site_users_on_reset_password_token", unique: true, using: :btree
  add_index "site_users", ["shop_id"], name: "index_site_users_on_shop_id", using: :btree

  create_table "site_users_subscriptions", id: false, force: :cascade do |t|
    t.integer "site_user_id",    null: false
    t.integer "subscription_id", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "auction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  add_index "skills", ["auction_id"], name: "index_skills_on_auction_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "billing_period"
    t.text     "description"
    t.integer  "business_user_id"
  end

  add_index "subscriptions", ["business_user_id"], name: "index_subscriptions_on_business_user_id", using: :btree

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

  create_table "userfiles", force: :cascade do |t|
    t.string   "filename"
    t.text     "description"
    t.integer  "site_user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "isapproved"
  end

  add_index "userfiles", ["site_user_id"], name: "index_userfiles_on_site_user_id", using: :btree

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
  add_foreign_key "paymentnotifications", "payments"
  add_foreign_key "paymentnotifications", "site_users"
  add_foreign_key "payments", "site_users"
  add_foreign_key "players", "auctions"
  add_foreign_key "players", "teams"
  add_foreign_key "seodetails", "shops"
  add_foreign_key "site_user_fields", "shops"
  add_foreign_key "site_users", "shops"
  add_foreign_key "skills", "auctions"
  add_foreign_key "subscriptions", "business_users"
  add_foreign_key "teamowners", "teams"
  add_foreign_key "teams", "auctions"
  add_foreign_key "userfiles", "site_users"
end
