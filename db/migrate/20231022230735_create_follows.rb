class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :store, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
