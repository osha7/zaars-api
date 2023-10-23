# == Schema Information
#
# Table name: styles
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Style < ApplicationRecord
  has_many(:listing_styles, :class_name => "ListingStyle", :foreign_key => "style_id", :dependent => :destroy)

  has_many(:listings, :through => :listing_styles, :source => :listing)
  
end
