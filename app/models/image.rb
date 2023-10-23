# == Schema Information
#
# Table name: images
#
#  id         :bigint           not null, primary key
#  image      :string
#  link       :string           default("https://res.cloudinary.com/djsz02nwd/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1599245196/image-not-avail-01_xaftr8.jpg")
#  video      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  listing_id :bigint
#  review_id  :bigint
#  store_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_images_on_listing_id  (listing_id)
#  index_images_on_review_id   (review_id)
#  index_images_on_store_id    (store_id)
#  index_images_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#  fk_rails_...  (review_id => reviews.id)
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
class Image < ApplicationRecord
  belongs_to(:review, :class_name => "Review", :foreign_key => "review_id", :required => false, :optional => true)
  belongs_to(:store, :class_name => "Store", :foreign_key => "store_id", :required => false, :optional => true)
  belongs_to(:user, :class_name => "User", :foreign_key => "user_id", :required => false, :optional => true)
  belongs_to(:listing, :class_name => "Listing", :foreign_key => "listing_id", :required => false, :optional => true)
end
