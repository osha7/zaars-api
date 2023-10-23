# == Schema Information
#
# Table name: types
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Type < ApplicationRecord
  has_many(:listings, :class_name => "Listing", :foreign_key => "type_id", :dependent => :destroy)
  
end
