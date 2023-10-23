# == Schema Information
#
# Table name: tailoring_sizes
#
#  id                   :bigint           not null, primary key
#  arm_round            :string
#  back_neck_depth      :string
#  bangel_circumference :string
#  below_chest          :string
#  body_length          :string
#  chest                :string
#  foot_size            :string
#  foot_width           :string
#  front_neck_depth     :string
#  full_length          :string
#  hip                  :string
#  length               :string
#  neck                 :string
#  shoe_circumference   :string
#  shoulder             :string
#  shoulder_round       :string
#  sleeve_length        :string
#  waist                :string
#  width                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  listing_id           :bigint           not null
#  user_id              :bigint
#
# Indexes
#
#  index_tailoring_sizes_on_listing_id  (listing_id)
#  index_tailoring_sizes_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#  fk_rails_...  (user_id => users.id)
#
class TailoringSize < ApplicationRecord
  belongs_to(:user, :required => false, :class_name => "User", :foreign_key => "user_id", :optional => true)
  belongs_to(:listing, :required => true, :class_name => "Listing", :foreign_key => "listing_id")
  
end
