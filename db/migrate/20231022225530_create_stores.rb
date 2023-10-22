class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.text :bio
      t.string :admin_name
      t.boolean :retailer
      t.references :user, null: false, foreign_key: true, index: true
      t.string :facebook
      t.string :instagram
      t.string :twitter
      t.integer :follows_count, default: 0
      t.integer :reviews_count, default: 0

      t.timestamps
    end
  end
end
