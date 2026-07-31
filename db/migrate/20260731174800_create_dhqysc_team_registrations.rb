class CreateDhqyscTeamRegistrations < ActiveRecord::Migration[7.2]
  def change
    create_table :dhqysc_team_registrations do |t|
      t.string :barracks, null: false
      t.string :sport, null: false
      t.string :team_gender, null: false
      t.string :team_captain, null: false
      t.string :coach, null: false
      t.jsonb :players, default: [], null: false
      t.string :travel_mode, null: false
      t.boolean :accommodation, null: false

      t.timestamps
    end

    add_index :dhqysc_team_registrations, :barracks
    add_index :dhqysc_team_registrations, :sport
    add_index :dhqysc_team_registrations, :team_gender
    add_index :dhqysc_team_registrations, [:barracks, :sport, :team_gender],
              unique: true,
              name: "index_dhqysc_team_regs_on_barracks_sport_gender"
  end
end
