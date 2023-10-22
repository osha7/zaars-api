class CreateTailoringSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :tailoring_sizes do |t|
      t.string :neck
      t.string :chest
      t.string :shoulder
      t.string :below_chest
      t.string :body_length
      t.string :sleeve_length
      t.string :arm_round
      t.string :shoulder_round
      t.string :front_neck_depth
      t.string :back_neck_depth
      t.string :waist
      t.string :hip
      t.string :full_length
      t.string :length
      t.string :width
      t.string :foot_width
      t.string :foot_size
      t.string :shoe_circumference
      t.string :bangel_circumference
      t.references :user, null: true, foreign_key: true, index: true, required: false, optional: true
      t.references :listing, null: false, foreign_key: true, index: true, required: true
  
      t.timestamps
    end
  end
end
