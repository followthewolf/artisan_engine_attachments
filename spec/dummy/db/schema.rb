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

ActiveRecord::Schema.define(:version => 20110517032537) do

  create_table "attachers", :force => true do |t|
    t.integer  "attachment_id"
    t.string   "attachment_type"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "position",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cyborgs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "name",           :null => false
    t.string   "image_file_uid", :null => false
    t.string   "crop_values"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
