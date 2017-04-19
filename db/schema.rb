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

ActiveRecord::Schema.define(version: 20170418165254) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.decimal  "lat",        precision: 10
    t.decimal  "lng",        precision: 10
    t.string   "comment"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nick"
    t.string   "password_digest"
    t.integer  "is_del",          default: 0,                     null: false
    t.datetime "created_at",      default: '2017-04-15 00:00:00', null: false
    t.datetime "updated_at",      default: '2017-04-15 00:00:00', null: false
    t.integer  "role_id"
    t.integer  "region_id"
  end

  create_table "authorities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "is_del",                   default: 0,                     null: false
    t.text     "comment",    limit: 65535,                                 null: false
    t.datetime "created_at",               default: '2017-04-15 00:00:00', null: false
    t.datetime "updated_at",               default: '2017-04-15 00:00:00', null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "logo"
    t.integer  "is_delete",  default: 0,                     null: false
    t.datetime "created_at", default: '2017-04-15 00:00:00', null: false
    t.datetime "updated_at", default: '2017-04-15 00:00:00', null: false
  end

  create_table "demos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at", default: '2017-04-15 00:00:00', null: false
    t.datetime "updated_at", default: '2017-04-15 00:00:00', null: false
  end

  create_table "merchant_categoryships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "merchant_id"
    t.integer  "category_id"
    t.datetime "created_at",  default: '2017-04-15 00:00:00', null: false
    t.datetime "updated_at",  default: '2017-04-15 00:00:00', null: false
  end

  create_table "merchant_productships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "merchant_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "merchants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nick"
    t.string   "password_digest"
    t.string   "mobile"
    t.string   "mail"
    t.datetime "created_at",      default: '2017-04-15 00:00:00', null: false
    t.datetime "updated_at",      default: '2017-04-15 00:00:00', null: false
    t.integer  "is_delete",       default: 0,                     null: false
    t.integer  "status",          default: 1,                     null: false
    t.string   "license"
    t.string   "comment"
    t.string   "logo"
    t.string   "card"
    t.string   "rename"
    t.string   "sex"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "logo"
    t.integer  "is_delete",              default: 0,                     null: false
    t.integer  "category_id"
    t.datetime "created_at",             default: '2017-04-15 00:00:00', null: false
    t.datetime "updated_at",             default: '2017-04-15 00:00:00', null: false
    t.float    "price",       limit: 24,                                 null: false
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rider_stationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "rider_id"
    t.integer  "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "riders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "password_digest",                                 null: false
    t.string   "mobile",                                          null: false
    t.string   "sex"
    t.string   "license_num"
    t.integer  "is_del",          default: 0,                     null: false
    t.datetime "created_at",      default: '2017-04-15 00:00:00', null: false
    t.datetime "updated_at",      default: '2017-04-15 00:00:00', null: false
    t.integer  "status",          default: 1,                     null: false
    t.string   "id_front"
    t.string   "id_back"
    t.integer  "region_id"
  end

  create_table "role_authorityships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "role_id"
    t.integer  "authority_id"
    t.datetime "created_at",   default: '2017-04-15 00:00:00', null: false
    t.datetime "updated_at",   default: '2017-04-15 00:00:00', null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nick"
    t.integer  "is_del",                   default: 0,                     null: false
    t.text     "comment",    limit: 65535,                                 null: false
    t.datetime "created_at",               default: '2017-04-15 00:00:00', null: false
    t.datetime "updated_at",               default: '2017-04-15 00:00:00', null: false
  end

  create_table "stations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.integer  "address_id"
    t.integer  "region_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "merchant_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      default: '2017-04-15 00:00:00', null: false
    t.datetime "updated_at",      default: '2017-04-15 00:00:00', null: false
    t.string   "sex"
    t.string   "mobile",                                          null: false
    t.string   "is_del",          default: "0",                   null: false
  end

end
