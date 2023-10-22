class CreateListingStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :listing_styles do |t|
      t.references :style, null: false, foreign_key: true, index: true
      t.references :listing, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
