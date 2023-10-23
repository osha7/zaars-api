# == Schema Information
#
# Table name: listing_styles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  listing_id :bigint           not null
#  style_id   :bigint           not null
#
# Indexes
#
#  index_listing_styles_on_listing_id  (listing_id)
#  index_listing_styles_on_style_id    (style_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#  fk_rails_...  (style_id => styles.id)
#
class ListingStyle < ApplicationRecord
  belongs_to(:style, :required => true, :class_name => "Style", :foreign_key => "style_id")
  belongs_to(:listing, :required => true, :class_name => "Listing", :foreign_key => "listing_id")
  
  end
  