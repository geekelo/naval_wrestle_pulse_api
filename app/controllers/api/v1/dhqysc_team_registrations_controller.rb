class Api::V1::DhqyscTeamRegistrationsController < ApplicationController
  before_action :set_dhqysc_team_registration, only: %i[show update destroy]

  def index
    dhqysc_team_registrations = DhqyscTeamRegistration.order(created_at: :desc)
    render json: dhqysc_team_registrations
  end

  def show
    render json: @dhqysc_team_registration
  end

  def create
    dhqysc_team_registration = DhqyscTeamRegistration.new(dhqysc_team_registration_params)

    if dhqysc_team_registration.save
      render json: dhqysc_team_registration, status: :created
    else
      render json: { errors: dhqysc_team_registration.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @dhqysc_team_registration.update(dhqysc_team_registration_params)
      render json: @dhqysc_team_registration
    else
      render json: { errors: @dhqysc_team_registration.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @dhqysc_team_registration.destroy
    head :no_content
  end

  private

  def set_dhqysc_team_registration
    @dhqysc_team_registration = DhqyscTeamRegistration.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "DHQYSC team registration not found" }, status: :not_found
  end

  def dhqysc_team_registration_params
    params.require(:dhqysc_team_registration).permit(
      :team_captain,
      :organization_unit,
      :male_count,
      :female_count,
      :total_count,
      :player_1,
      :player_2,
      :player_3,
      :player_4,
      :player_5,
      :player_6,
      :player_7,
      :player_8,
      :player_9,
      :player_10,
      :travel_mode,
      :accommodation,
      female_categories: [],
      male_categories: []
    )
  end
end
