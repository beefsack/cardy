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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111117062406) do

  create_table "cards", :force => true do |t|
    t.text     "front"
    t.text     "back"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deck_cards", :force => true do |t|
    t.integer  "deck_id"
    t.integer  "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deck_children", :force => true do |t|
    t.integer  "deck_id"
    t.integer  "parent_deck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "decks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_deck_session_card_attempts", :force => true do |t|
    t.integer  "user_deck_session_card_id"
    t.integer  "card_id"
    t.integer  "confidence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_deck_session_cards", :force => true do |t|
    t.integer  "user_deck_session_id"
    t.integer  "card_id"
    t.integer  "confidence"
    t.datetime "last_attempted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_deck_sessions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "deck_id"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "focus"
    t.integer  "target_confidence"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
