# == Schema Information
#
# Table name: listing_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  listing_id :bigint           not null
#  tag_id     :bigint           not null
#
# Indexes
#
#  index_listing_tags_on_listing_id  (listing_id)
#  index_listing_tags_on_tag_id      (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#  fk_rails_...  (tag_id => tags.id)
#
class ListingTag < ApplicationRecord
  belongs_to(:tag, :required => true, :class_name => "Tag", :foreign_key => "tag_id")
  belongs_to(:listing, :required => true, :class_name => "Listing", :foreign_key => "listing_id")
end
