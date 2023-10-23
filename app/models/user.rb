# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  authentication_token   :string(30)
#  city                   :string
#  country                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  facebook               :string
#  first_name             :string
#  follows_count          :integer          default(0)
#  instagram              :string
#  last_name              :string
#  phone_number           :string
#  private                :boolean          default(TRUE)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  reviews_count          :integer          default(0)
#  seller_account         :boolean          default(FALSE)
#  state                  :string
#  street_address         :string
#  street_address_2       :string
#  twitter                :string
#  username               :citext
#  zip                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  stripe_account_id      :string
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

require 'stripe'

class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one(:avatar, :class_name => "Image", :foreign_key => "user_id", :dependent => :destroy)

  has_many(:reviews, :class_name => "Review", :foreign_key => "user_id", :dependent => :destroy)
  has_many(:follows, :class_name => "Follow", :foreign_key => "user_id", :dependent => :destroy)
  has_many(:tailoring_sizes, :class_name => "TailoringSize", :foreign_key => "user_id", :dependent => :destroy)
  has_many(:cart_listings, :class_name => "CartListing", :foreign_key => "user_id", :dependent => :destroy)
  has_many(:orders, :class_name => "Order", :foreign_key => "user_id", :dependent => :destroy)
  has_many(:stores, :class_name => "Store", :foreign_key => "user_id", :dependent => :destroy)
  has_many(:listings, :class_name => "Listing", :foreign_key => "buyer_id", :dependent => :destroy)
  has_many(:user_listings, :through => :stores, :source => :listings)
  
  has_many :followers, through: :follows
  has_many :reviews_received, through: :reviews
  
  # TODO: don't know if this is correct or even necessary
  has_many :followed_stores, through: :follows, source: :store
  has_many :reviewed_stores, through: :reviews, source: :store
  
  # flushing this out:  (please also see store)
  has_many(:offers, :class_name => "Offer", :foreign_key => "user_id", :dependent => :destroy)
  has_many(:sent_offers, :class_name => "Offer", :foreign_key => "user_id", :dependent => :destroy)
  has_many(:accepted_sent_offers, -> { where(status: "accepted") }, :class_name => "Offer", :foreign_key => "user_id", :dependent => :destroy)
  has_many :finalized_sent_offers, through: :accepted_sent_offers, source: :store 
  
  validates :username, presence: true, uniqueness: true

  # TODO: check this logic when there is sample data
  scope :recently_followed_stores, -> { order(follows: :desc) }
  
end
