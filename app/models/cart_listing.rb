# == Schema Information
#
# Table name: cart_listings
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  alt_user_id :bigint
#  listing_id  :bigint           not null
#  user_id     :bigint
#
# Indexes
#
#  index_cart_listings_on_listing_id  (listing_id)
#  index_cart_listings_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#  fk_rails_...  (user_id => users.id)
#
class CartListing < ApplicationRecord
  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id")
  belongs_to(:listing, :required => true, :class_name => "Listing", :foreign_key => "listing_id")
end
