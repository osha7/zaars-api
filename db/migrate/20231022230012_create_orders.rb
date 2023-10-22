class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.boolean :within_return_window
      t.string :status
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
