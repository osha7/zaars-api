# == Schema Information
#
# Table name: orders
#
#  id                   :bigint           not null, primary key
#  status               :string
#  within_return_window :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id")
  has_many(:listings, :class_name => "Listing", :foreign_key => "order_id", :dependent => :destroy)
  has_many(:listing_shipping_statuses, :class_name => "ListingShippingStatus", :foreign_key => "order_id", :dependent => :destroy)
  
  enum status: { purchased: "purchased", fulfilled: "fulfilled", abandoned: "abandoned" }

end
