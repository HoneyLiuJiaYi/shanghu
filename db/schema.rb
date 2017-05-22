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

ActiveRecord::Schema.define(version: 20170521162829) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                             collation: "utf8_general_ci"
    t.decimal  "lat",        precision: 10, scale: 6
    t.decimal  "lng",        precision: 10, scale: 6
    t.string   "comment",                                          collation: "utf8_general_ci"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "nick",                                     collation: "utf8_general_ci"
    t.string   "password_digest",                          collation: "utf8_general_ci"
    t.integer  "is_del",          default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role_id"
    t.integer  "region_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                collation: "utf8_general_ci"
    t.string   "logo"
    t.integer  "is_delete",  default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cityprices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "city"
    t.string  "product_id"
    t.decimal "price",      precision: 10
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                               collation: "utf8_general_ci"
    t.datetime "from"
    t.datetime "to"
    t.decimal  "price",      precision: 10
    t.decimal  "discount",   precision: 10
    t.integer  "is_del",                    default: 0, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "functions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                    collation: "utf8_general_ci"
    t.string   "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "price",      precision: 10
    t.integer  "amount"
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "order_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_card_id"
    t.decimal  "real_money",   precision: 10
    t.decimal  "fake_money",   precision: 10
    t.string   "method",                                                collation: "utf8_general_ci"
    t.integer  "status"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "order_id",                    default: -1, null: false
  end

  create_table "merchant_incomes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "merchant_id"
    t.decimal  "price",         precision: 10
    t.decimal  "discount",      precision: 10
    t.integer  "order_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "is_settlement",                default: 1, null: false
  end

  create_table "merchant_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "money",       precision: 10, scale: 6
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "merchant_id"
  end

  create_table "merchant_orderships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "merchant_id"
    t.integer  "order_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "is_del",      default: 0, null: false
  end

  create_table "merchant_productships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "merchant_id"
    t.integer  "product_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.decimal  "price",       precision: 10, scale: 6
  end

  create_table "merchant_stationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "merchant_id"
    t.integer  "station_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "merchants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "nick",                                     collation: "utf8_general_ci"
    t.string   "password_digest"
    t.string   "mobile"
    t.string   "mail"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "is_delete",       default: 0, null: false
    t.integer  "status",          default: 1, null: false
    t.string   "license"
    t.string   "comment"
    t.string   "logo"
    t.string   "card"
    t.string   "rename",                                   collation: "utf8_general_ci"
    t.string   "sex"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user_id",                                              collation: "latin1_swedish_ci"
    t.string   "address_id",                                           collation: "latin1_swedish_ci"
    t.decimal  "price",        precision: 10
    t.integer  "status",                      default: 0, null: false
    t.integer  "is_del",                      default: 0, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "product_id",                              null: false
    t.integer  "product_nums"
    t.decimal  "discount",     precision: 10, default: 0, null: false
  end

  create_table "orderstations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "station_id"
    t.string  "order_id"
    t.integer "is_del",     default: 0, null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                                          collation: "utf8_general_ci"
    t.string   "logo"
    t.integer  "is_delete",                            default: 0, null: false
    t.integer  "category_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.decimal  "price1",      precision: 10, scale: 6
    t.decimal  "price2",      precision: 10, scale: 6
    t.decimal  "price3",      precision: 10, scale: 6
    t.decimal  "price4",      precision: 10, scale: 6
    t.decimal  "price5",      precision: 10, scale: 6
    t.decimal  "price6",      precision: 10, scale: 6
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                    collation: "utf8_general_ci"
    t.integer  "parent_id"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rider_stationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "rider_id"
    t.integer  "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "riderorders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "rider_id"
    t.string   "order_id"
    t.integer  "is_del",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "riders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                     collation: "utf8_general_ci"
    t.string   "password_digest",             null: false
    t.string   "mobile",                      null: false
    t.string   "sex"
    t.string   "license_num"
    t.integer  "is_del",          default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "status",          default: 1, null: false
    t.string   "id_front"
    t.string   "id_back"
    t.integer  "region_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nick"
    t.integer  "is_del",                   default: 0, null: false
    t.text     "comment",    limit: 65535,             null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "stations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "address_id"
    t.integer  "region_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "is_del",     default: 0, null: false
    t.integer  "status",     default: 0, null: false
  end

  create_table "user_adddressships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.decimal  "real_money", precision: 10, scale: 2, default: "0.0"
    t.decimal  "fake_money", precision: 10, scale: 2, default: "100.0"
    t.integer  "is_del",                              default: 0,       null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "user_couponships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "coupon_id"
    t.integer  "is_del",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "useraddresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "user_id",                             collation: "latin1_swedish_ci"
    t.string  "address",   default: "", null: false
    t.string  "latitude",                            collation: "latin1_swedish_ci"
    t.string  "longitude",                           collation: "latin1_swedish_ci"
    t.integer "is_del",    default: 0,  null: false
    t.string  "phone"
    t.string  "remark"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "password_digest",                            collation: "latin1_swedish_ci"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "sex",                                        collation: "latin1_swedish_ci"
    t.string   "mobile",                        null: false, collation: "latin1_swedish_ci"
    t.string   "is_del",          default: "0", null: false, collation: "latin1_swedish_ci"
  end

end
