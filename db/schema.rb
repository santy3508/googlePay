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

ActiveRecord::Schema.define(version: 2018_12_13_101446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bankaccounts", force: :cascade do |t|
    t.string "acc_no"
    t.string "ifsc"
    t.string "balance"
    t.string "bank"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bankaccounts_on_user_id"
  end

  create_table "rules", force: :cascade do |t|
    t.string "period"
    t.integer "limit"
    t.integer "minrange"
    t.integer "maxrange"
    t.string "transactiontype"
    t.integer "maxscratch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scratchcards", force: :cascade do |t|
    t.string "user_id"
    t.integer "amount"
    t.bigint "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_id"], name: "index_scratchcards_on_transaction_id"
  end



  create_table "transactions", force: :cascade do |t|
    t.bigint "user_id_1_id"
    t.bigint "user_id_2_id"
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id_1_id"], name: "index_transactions_on_user_id_1_id"
    t.index ["user_id_2_id"], name: "index_transactions_on_user_id_2_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "passcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
