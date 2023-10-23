# == Schema Information
#
# Table name: follows
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_follows_on_store_id  (store_id)
#  index_follows_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
class Follow < ApplicationRecord
  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true)
  belongs_to(:store, :required => true, :class_name => "Store", :foreign_key => "store_id", :counter_cache => true)
end
