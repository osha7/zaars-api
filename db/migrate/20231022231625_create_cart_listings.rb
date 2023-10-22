class CreateCartListings < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_listings do |t|
      t.bigint :alt_user_id
      t.references :user, null: true, foreign_key: true, index: true
      t.references :listing, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
