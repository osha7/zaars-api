class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.float :price
      t.string :status, default: 'pending'
      t.references :user, null: false, foreign_key: true, index: true
      t.references :listing, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
