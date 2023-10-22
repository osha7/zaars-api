class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :link, :default => "https://res.cloudinary.com/djsz02nwd/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1599245196/image-not-avail-01_xaftr8.jpg"
      t.string :image
      t.string :video
      t.references :user, foreign_key: true, index: true, null: true, required: false, optional: true
      t.references :store, foreign_key: true, index: true, null: true, required: false, optional: true
      t.references :listing, foreign_key: true, index: true, null: true, required: false, optional: true
      t.references :review, foreign_key: true, index: true, null: true, required: false, optional: true

      t.timestamps
    end
  end
end
