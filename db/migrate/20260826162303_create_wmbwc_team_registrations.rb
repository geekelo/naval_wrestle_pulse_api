class CreateWmbwcTeamRegistrations < ActiveRecord::Migration[7.2]
  def change
    create_table :wmbwc_team_registrations do |t|
      t.string :team_captain, null: false
      t.string :organization_unit, null: false

      t.integer :male_count, default: 0, null: false
      t.integer :female_count, default: 0, null: false
      t.integer :total_count, default: 0, null: false

      t.string :player_1, null: false
      t.string :player_2, null: false
      t.string :player_3, null: false
      t.string :player_4, null: false
      t.string :player_5, null: false
      t.string :player_6, null: false
      t.string :player_7, null: false
      t.string :player_8, null: false
      t.string :player_9, null: false
      t.string :player_10, null: false

      t.jsonb :female_categories, default: [], null: false
      t.jsonb :male_categories, default: [], null: false

      t.string :travel_mode, null: false
      t.boolean :accommodation, null: false

      t.timestamps
    end
  end
end
