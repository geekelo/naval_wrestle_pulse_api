class Api::V1::TeamRegistrationsController < ApplicationController
  before_action :set_team_registration, only: %i[show update destroy]

  def index
    team_registrations = TeamRegistration.order(created_at: :desc)
    render json: team_registrations
  end

  def show
    render json: @team_registration
  end

  def create
    team_registration = TeamRegistration.new(team_registration_params)

    if team_registration.save
      render json: team_registration, status: :created
    else
      render json: { errors: team_registration.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @team_registration.update(team_registration_params)
      render json: @team_registration
    else
      render json: { errors: @team_registration.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @team_registration.destroy
    head :no_content
  end

  private

  def set_team_registration
    @team_registration = TeamRegistration.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Team registration not found" }, status: :not_found
  end

  def team_registration_params
    params.require(:team_registration).permit(
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
