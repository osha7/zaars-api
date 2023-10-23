# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_10_23_010904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "cart_listings", force: :cascade do |t|
    t.bigint "alt_user_id"
    t.bigint "user_id"
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_cart_listings_on_listing_id"
    t.index ["user_id"], name: "index_cart_listings_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_follows_on_store_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "link", default: "https://res.cloudinary.com/djsz02nwd/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1599245196/image-not-avail-01_xaftr8.jpg"
    t.string "image"
    t.string "video"
    t.bigint "user_id"
    t.bigint "store_id"
    t.bigint "listing_id"
    t.bigint "review_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_images_on_listing_id"
    t.index ["review_id"], name: "index_images_on_review_id"
    t.index ["store_id"], name: "index_images_on_store_id"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "listing_shipping_statuses", force: :cascade do |t|
    t.string "tracking_number"
    t.boolean "shipping_status"
    t.bigint "listing_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_listing_shipping_statuses_on_listing_id"
    t.index ["order_id"], name: "index_listing_shipping_statuses_on_order_id"
  end

  create_table "listing_styles", force: :cascade do |t|
    t.bigint "style_id", null: false
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_listing_styles_on_listing_id"
    t.index ["style_id"], name: "index_listing_styles_on_style_id"
  end

  create_table "listing_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_listing_tags_on_listing_id"
    t.index ["tag_id"], name: "index_listing_tags_on_tag_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.integer "quantity"
    t.float "price"
    t.text "description"
    t.string "condition"
    t.string "gender"
    t.string "material"
    t.string "color"
    t.string "brand"
    t.boolean "tailoring_offered", default: false
    t.string "product_code"
    t.float "weight"
    t.string "weight_unit"
    t.boolean "offers_accepted", default: false
    t.float "shipping_cost"
    t.bigint "type_id"
    t.bigint "order_id"
    t.bigint "store_id", null: false
    t.bigint "buyer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_listings_on_buyer_id"
    t.index ["order_id"], name: "index_listings_on_order_id"
    t.index ["store_id"], name: "index_listings_on_store_id"
    t.index ["type_id"], name: "index_listings_on_type_id"
  end

  create_table "offers", force: :cascade do |t|
    t.float "price"
    t.string "status", default: "pending"
    t.bigint "user_id", null: false
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_offers_on_listing_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "within_return_window"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "write_up"
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_reviews_on_store_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "store_name"
    t.text "bio"
    t.string "admin_name"
    t.boolean "retailer"
    t.bigint "user_id", null: false
    t.string "facebook"
    t.string "instagram"
    t.string "twitter"
    t.integer "follows_count", default: 0
    t.integer "reviews_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tailoring_sizes", force: :cascade do |t|
    t.string "neck"
    t.string "chest"
    t.string "shoulder"
    t.string "below_chest"
    t.string "body_length"
    t.string "sleeve_length"
    t.string "arm_round"
    t.string "shoulder_round"
    t.string "front_neck_depth"
    t.string "back_neck_depth"
    t.string "waist"
    t.string "hip"
    t.string "full_length"
    t.string "length"
    t.string "width"
    t.string "foot_width"
    t.string "foot_size"
    t.string "shoe_circumference"
    t.string "bangel_circumference"
    t.bigint "user_id"
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_tailoring_sizes_on_listing_id"
    t.index ["user_id"], name: "index_tailoring_sizes_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.citext "username"
    t.string "first_name"
    t.string "last_name"
    t.string "street_address"
    t.string "street_address_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.string "phone_number"
    t.boolean "private", default: true
    t.string "facebook"
    t.string "instagram"
    t.string "twitter"
    t.string "stripe_account_id"
    t.boolean "seller_account", default: false
    t.integer "follows_count", default: 0
    t.integer "reviews_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "cart_listings", "listings"
  add_foreign_key "cart_listings", "users"
  add_foreign_key "follows", "stores"
  add_foreign_key "follows", "users"
  add_foreign_key "images", "listings"
  add_foreign_key "images", "reviews"
  add_foreign_key "images", "stores"
  add_foreign_key "images", "users"
  add_foreign_key "listing_shipping_statuses", "listings"
  add_foreign_key "listing_shipping_statuses", "orders"
  add_foreign_key "listing_styles", "listings"
  add_foreign_key "listing_styles", "styles"
  add_foreign_key "listing_tags", "listings"
  add_foreign_key "listing_tags", "tags"
  add_foreign_key "listings", "orders"
  add_foreign_key "listings", "stores"
  add_foreign_key "listings", "types"
  add_foreign_key "listings", "users", column: "buyer_id"
  add_foreign_key "offers", "listings"
  add_foreign_key "offers", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "stores"
  add_foreign_key "reviews", "users"
  add_foreign_key "stores", "users"
  add_foreign_key "tailoring_sizes", "listings"
  add_foreign_key "tailoring_sizes", "users"
end
