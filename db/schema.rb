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

ActiveRecord::Schema.define(version: 20141227204141) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "atw_rseventspro_events", force: true do |t|
    t.integer  "parent"
    t.string   "name"
    t.datetime "createdtime"
    t.datetime "starttime"
    t.datetime "endtime"
    t.string   "description"
    t.string   "location"
    t.string   "owner"
    t.string   "URL"
    t.string   "email"
    t.string   "phone"
    t.string   "metaname"
    t.string   "metakeywords"
    t.string   "metadescription"
    t.boolean  "recurring"
    t.string   "repeat_also"
    t.boolean  "registration"
    t.boolean  "comments"
    t.string   "icon"
    t.boolean  "repeat_interval"
    t.integer  "repeat_type"
    t.datetime "repeat_end"
    t.datetime "start_registration"
    t.datetime "end_registration"
    t.datetime "unsubscribe_date"
    t.boolean  "payments"
    t.integer  "max_tickets"
    t.integer  "max_tickets_amount"
    t.boolean  "notify_me"
    t.boolean  "notify_me_unsubscribe"
    t.boolean  "overbooking"
    t.integer  "overbooking_amount"
    t.boolean  "show_registered"
    t.boolean  "automatically_approve"
    t.string   "paypal_email"
    t.boolean  "discounts"
    t.boolean  "form"
    t.boolean  "early_fee"
    t.integer  "early_fee_type"
    t.datetime "early_fee_end"
    t.datetime "late_fee"
    t.integer  "late_fee_type"
    t.datetime "late_fee_start"
    t.string   "options"
    t.boolean  "archived"
    t.boolean  "published"
    t.boolean  "completed"
    t.boolean  "approved"
    t.boolean  "ticket_pdf"
    t.string   "ticket_pdf_layout"
    t.string   "properties"
    t.string   "gallery_tags"
    t.boolean  "allday"
    t.boolean  "featured"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "atw_rseventspro_users", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.datetime "date"
    t.boolean  "state"
    t.string   "verification"
    t.integer  "SubmissionId"
    t.string   "gateway"
    t.string   "ip"
    t.string   "URL"
    t.string   "params"
    t.decimal  "discount"
    t.decimal  "early_fee"
    t.decimal  "late_fee"
    t.decimal  "tax"
    t.string   "log"
    t.string   "lang"
    t.string   "coupon"
    t.string   "ideal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "atw_users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "usertype"
    t.boolean  "block"
    t.boolean  "sendEmail"
    t.datetime "registerDate"
    t.datetime "lastvisitDate"
    t.boolean  "activation"
    t.string   "params"
    t.datetime "lastResetTime"
    t.integer  "resetCount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "event_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["event_id"], name: "index_taggings_on_event_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
