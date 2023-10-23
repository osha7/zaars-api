# == Schema Information
#
# Table name: listing_shipping_statuses
#
#  id              :bigint           not null, primary key
#  shipping_status :boolean
#  tracking_number :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  listing_id      :bigint           not null
#  order_id        :bigint           not null
#
# Indexes
#
#  index_listing_shipping_statuses_on_listing_id  (listing_id)
#  index_listing_shipping_statuses_on_order_id    (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#  fk_rails_...  (order_id => orders.id)
#
class ListingShippingStatus < ApplicationRecord
  belongs_to(:listing, :required => true, :class_name => "Listing", :foreign_key => "listing_id")
  belongs_to(:order, :required => true, :class_name => "Order", :foreign_key => "order_id")
  
end
