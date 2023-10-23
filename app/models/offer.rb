# == Schema Information
#
# Table name: offers
#
#  id         :bigint           not null, primary key
#  price      :float
#  status     :string           default("pending")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  listing_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_offers_on_listing_id  (listing_id)
#  index_offers_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#  fk_rails_...  (user_id => users.id)
#
class Offer < ApplicationRecord
  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id")
  belongs_to(:listing, :required => true, :class_name => "Listing", :foreign_key => "listing_id")

  has_one(:store, :through => :listing, :source => :store)

  enum status: { pending: "pending", rejected: "rejected", accepted: "accepted" }
  # offer.status?       
  # offer.status!       # set's value to status and saves
  # also have: scope :not_accepted, -> { where.not(status: "accepted") }
end
