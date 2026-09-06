class CreateWmbwcFeedbacks < ActiveRecord::Migration[7.2]
  def change
    create_table :wmbwc_feedbacks do |t|
      t.string :country, null: false
      t.integer :airport_reception, null: false
      t.integer :movement_to_hotel, null: false
      t.integer :hotel_accommodation, null: false
      t.integer :feeding, null: false
      t.integer :wifi, null: false
      t.integer :professionalism_of_reception_team, null: false
      t.integer :professionalism_of_hotel_team, null: false
      t.integer :general_assessment_so_far, null: false
      t.text :comment

      t.timestamps
    end

    add_index :wmbwc_feedbacks, :country
  end
end
