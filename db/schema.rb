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

ActiveRecord::Schema.define(version: 20170126005409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_environments", force: :cascade do |t|
    t.integer  "application_id"
    t.integer  "environment_id"
    t.string   "rails_env"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "applications", force: :cascade do |t|
    t.string   "name"
    t.boolean  "uses_sidekiq"
    t.boolean  "uses_postgres"
    t.boolean  "uses_redis"
    t.boolean  "uses_ldap"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "elastic_searches", force: :cascade do |t|
    t.integer  "application_environment_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "user"
    t.string   "password"
    t.string   "host"
    t.integer  "port"
  end

  create_table "environments", force: :cascade do |t|
    t.string   "name"
    t.string   "consul_dc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postgresqls", force: :cascade do |t|
    t.integer  "application_environment_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "user"
    t.string   "password"
    t.string   "host"
    t.integer  "port"
    t.string   "database"
  end

  create_table "redis", force: :cascade do |t|
    t.integer  "application_environment_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "user"
    t.string   "password"
    t.string   "host"
    t.integer  "port"
    t.integer  "db"
  end

  create_table "secrets", force: :cascade do |t|
    t.integer  "application_environment_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                       null: false
    t.integer  "sign_in_count",      default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
