# == Schema Information
#
# Table name: stores
#
#  id            :bigint           not null, primary key
#  admin_name    :string
#  bio           :text
#  facebook      :string
#  follows_count :integer          default(0)
#  instagram     :string
#  retailer      :boolean
#  reviews_count :integer          default(0)
#  store_name    :string
#  twitter       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_stores_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Store < ApplicationRecord
  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id")
  has_one(:avatar, :class_name => "Image", :foreign_key => "store_id", :dependent => :destroy)

  has_many(:listings, :class_name => "Listing", :foreign_key => "store_id", :dependent => :destroy)
  has_many(:reviews, :class_name => "Review", :foreign_key => "store_id", :dependent => :destroy)
  has_many(:followers, :class_name => "Follow", :foreign_key => "store_id", :dependent => :destroy)

  # flushing this out:  (please also see user)
  has_many(:offers, :through => :listings, :source => :offers, :dependent => :destroy)
  has_many(:received_offers, :through => :listings, :foreign_key => "store_id", :source => :offers, :dependent => :destroy)
  has_many(:accepted_received_offers, -> { where(status: "accepted") }, :class_name => "Offer", :foreign_key => "store_id", :dependent => :destroy)
  has_many :finalized_received_offers, through: :accepted_received_offers, source: :user

  # TODO: check this logic when there is sample data
  scope :recent_reviews, -> { order(reviews: :desc) }

end
