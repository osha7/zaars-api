# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many(:listing_tags, :class_name => "ListingTag", :foreign_key => "tag_id", :dependent => :destroy)

  has_many(:listings, :through => :listing_tags, :source => :listing)
  
end
