class CreateGuestRegistrations < ActiveRecord::Migration[7.2]
  def change
    create_table :guest_registrations do |t|
      t.string :country, null: false
      t.string :full_name, null: false
      t.string :rank_title, null: false
      t.string :organization_unit, null: false
      t.string :appointment, null: false
      t.string :travel_mode, null: false
      t.boolean :accommodation, null: false

      t.timestamps
    end

    add_index :guest_registrations, :full_name
    add_index :guest_registrations, :organization_unit
    add_index :guest_registrations, :country
  end
end
