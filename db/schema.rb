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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120719111846) do

  create_table "accounts", :force => true do |t|
    t.string   "title"
    t.string   "features"
    t.datetime "image_updated_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.decimal  "price"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "provider",   :null => false
    t.string   "uid",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "banners", :force => true do |t|
    t.string "name"
  end

  create_table "blog_comments", :force => true do |t|
    t.integer  "blog_post_id"
    t.integer  "user_id"
    t.string   "user_ip"
    t.string   "user_agent"
    t.string   "referrer"
    t.string   "name"
    t.string   "site_url"
    t.string   "email"
    t.text     "body"
    t.datetime "created_at"
  end

  add_index "blog_comments", ["blog_post_id"], :name => "index_blog_comments_on_blog_post_id"

  create_table "blog_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "blog_post_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "blog_images", ["blog_post_id"], :name => "index_blog_images_on_blog_post_id"

  create_table "blog_posts", :force => true do |t|
    t.string   "title",                           :null => false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",    :default => false, :null => false
    t.integer  "user_id"
    t.datetime "published_at"
  end

  create_table "blog_tags", :force => true do |t|
    t.integer "blog_post_id"
    t.string  "tag",          :null => false
  end

  add_index "blog_tags", ["blog_post_id"], :name => "index_blog_tags_on_blog_post_id"
  add_index "blog_tags", ["tag"], :name => "index_blog_tags_on_tag"

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data",                         :null => false
    t.integer  "assetable_id"
    t.string   "assetable_type", :limit => 30
    t.string   "type",           :limit => 30
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "feeds", :force => true do |t|
    t.text     "message"
    t.integer  "user_id"
    t.integer  "store_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "feed_for"
  end

  create_table "images", :force => true do |t|
    t.string   "snap_file_name"
    t.string   "snap_content_type"
    t.integer  "snap_file_size"
    t.datetime "snap_updated_at"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "product_id"
    t.integer  "product_detail_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "store_id"
    t.integer  "user_id"
    t.boolean  "is_banner"
    t.integer  "profile_image_id"
    t.integer  "bg_image_id"
  end

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "from_user"
    t.integer  "to_user"
    t.boolean  "read"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_details", :force => true do |t|
    t.integer  "product_detail_id"
    t.integer  "order_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "order_transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "message"
    t.date     "purchased_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "package_rules", :force => true do |t|
    t.integer  "package_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "packages", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.text     "html"
    t.text     "css"
    t.text     "script"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_details", :force => true do |t|
    t.integer  "product_id"
    t.string   "size"
    t.string   "color"
    t.float    "price"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "product_quantity"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "store_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "verification_value"
    t.integer  "month"
    t.integer  "year"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_1"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "zip"
    t.string   "email"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "cc_type"
    t.string   "paypal_profile_number"
    t.integer  "account_id"
    t.string   "credit_card_number"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "store_packages", :force => true do |t|
    t.string "name"
  end

  create_table "stores", :force => true do |t|
    t.integer  "package_id"
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "is_featured"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "account_id"
    t.string   "stripe_customer_token"
    t.string   "paypal_customer_token"
    t.string   "paypal_recurring_profile_token"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                        :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "name"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "role"
    t.string   "store_name"
    t.integer  "profile_id"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
