class DhqyscTeamRegistration < ApplicationRecord
  validates :barracks, :sport, :team_gender, :team_captain, :coach, presence: true
  validates :barracks, uniqueness: {
    scope: %i[sport team_gender],
    message: "already has a team registered for this sport and gender"
  }
end
