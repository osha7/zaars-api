class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :size
      t.integer :quantity
      t.float :price
      t.text :description
      t.string :condition
      t.string :gender
      t.string :material
      t.string :color
      t.string :brand
      t.boolean :tailoring_offered, default: false
      t.string :product_code
      t.float :weight
      t.string :weight_unit
      t.boolean :offers_accepted, default: false
      t.float :shipping_cost
      t.references :type, null: true, foreign_key: true, index: true, required: false, optional: true
      t.references :order, null: true, foreign_key: true, index: true, required: false, optional: true
      t.references :store, null: false, foreign_key: true, index: true, required: true
      t.references :buyer, null: true, index: true, foreign_key: {to_table: :users}, required: false, optional: true

      t.timestamps
    end
  end
end
