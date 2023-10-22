class CreateListingShippingStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :listing_shipping_statuses do |t|
      t.string :tracking_number
      t.boolean :shipping_status
      t.references :listing, null: false, foreign_key: true, index: true
      t.references :order, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
