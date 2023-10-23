# == Schema Information
#
# Table name: listings
#
#  id                :bigint           not null, primary key
#  brand             :string
#  color             :string
#  condition         :string
#  description       :text
#  gender            :string
#  material          :string
#  name              :string
#  offers_accepted   :boolean          default(FALSE)
#  price             :float
#  product_code      :string
#  quantity          :integer
#  shipping_cost     :float
#  size              :string
#  tailoring_offered :boolean          default(FALSE)
#  weight            :float
#  weight_unit       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  buyer_id          :bigint
#  order_id          :bigint
#  store_id          :bigint           not null
#  type_id           :bigint
#
# Indexes
#
#  index_listings_on_buyer_id  (buyer_id)
#  index_listings_on_order_id  (order_id)
#  index_listings_on_store_id  (store_id)
#  index_listings_on_type_id   (type_id)
#
# Foreign Keys
#
#  fk_rails_...  (buyer_id => users.id)
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (type_id => types.id)
#
class Listing < ApplicationRecord
  belongs_to(:type, :required => false, :class_name => "Type", :foreign_key => "type_id", :optional => true) # change this back to :required => true when seeds built
  belongs_to(:order, :required => false, :optional => true) 
  belongs_to(:store, :required => true, :class_name => "Store", :foreign_key => "store_id")
  belongs_to(:buyer, :required => false, :class_name => "User", :foreign_key => "buyer_id", :optional => true)

  has_many(:images, :class_name => "Image", :foreign_key => "listing_id", :dependent => :destroy)

  has_many(:listing_styles, :class_name => "ListingStyle", :foreign_key => "listing_id", :dependent => :destroy)
  has_many(:listing_tags, :class_name => "ListingTag", :foreign_key => "listing_id", :dependent => :destroy)
  has_many(:offers, :class_name => "Offer", :foreign_key => "listing_id", :dependent => :destroy)
  has_many(:cart_listings, :class_name => "CartListing", :foreign_key => "listing_id", :dependent => :destroy)
  has_many(:tailoring_sizes, :class_name => "TailoringSize", :foreign_key => "listing_id", :dependent => :destroy)
  has_many(:listing_shipping_statuses, :class_name => "ListingShippingStatus", :foreign_key => "listing_id", :dependent => :destroy)

  has_many(:tags, :through => :listing_tags, :source => :tag)
  has_many(:styles, :through => :listing_styles, :source => :style)
  has_one(:user, :through => :store, :source => :user) # ???

  validates :store_id, presence: true
  validates :condition, presence: true
  validates :description, presence: true
  validates :gender, presence: true
  validates :shipping_cost, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :size, presence: true
  validates :brand, presence: true
  validates :color, presence: true
  validates :material, presence: true
  validates :weight, presence: true
  validates :weight_unit, presence: true

  enum gender: { womens: "womens", mens: "mens", unisex: "unisex" }
  enum size: { x_small: "x-small", small: "small", medium: "medium", large: "large", x_large: "x-large", two_x: "2x", three_x: "3x" }

end
