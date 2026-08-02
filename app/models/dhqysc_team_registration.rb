class DhqyscTeamRegistration < ApplicationRecord
  validates :barracks, :sport, :team_gender, :team_captain, :coach, presence: true
  validate :unique_barracks_sport_and_gender

  private

  def unique_barracks_sport_and_gender
    return if barracks.blank? || sport.blank? || team_gender.blank?

    scope = self.class.where(barracks: barracks, sport: sport, team_gender: team_gender)
    scope = scope.where.not(id: id) if persisted?

    return unless scope.exists?

    errors.add(
      :base,
      "#{barracks} already has a #{team_gender} team registered for this sport and gender"
    )
  end
end
