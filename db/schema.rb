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

ActiveRecord::Schema.define(version: 20141220121014) do

  create_table "application_to_database_ratios", force: true do |t|
    t.decimal "application"
    t.decimal "database"
  end

  create_table "assumptions_at_targets", force: true do |t|
    t.integer "percentage"
    t.decimal "decimal"
  end

  create_table "bladeparameters", force: true do |t|
    t.integer "pcore"
    t.integer "pram"
    t.integer "pnic"
  end

  create_table "components", force: true do |t|
    t.string "product"
    t.string "platform"
    t.string "servername"
  end

  create_table "designrationales", force: true do |t|
    t.string  "landscape"
    t.integer "pcore"
    t.integer "pram"
    t.integer "pnic"
  end

  create_table "infracatalogs", force: true do |t|
    t.string  "catalog"
    t.string  "subcatalog"
    t.integer "vcpu"
    t.integer "vram"
    t.integer "vnic"
  end

  create_table "landscapes", force: true do |t|
    t.string "name"
  end

  create_table "quick_sizers", force: true do |t|
    t.string  "product"
    t.string  "platform"
    t.integer "saps"
    t.integer "memory"
    t.integer "io"
    t.integer "iops"
    t.integer "disksize"
  end

  create_table "resourceweightages", force: true do |t|
    t.integer "cpu"
    t.integer "ram"
    t.integer "nic"
  end

  create_table "users", force: true do |t|
    t.string "username"
    t.string "password"
    t.string "role"
  end

  create_table "vmware_ha_server_reqs", force: true do |t|
    t.integer "protected"
    t.integer "failover"
  end

end
