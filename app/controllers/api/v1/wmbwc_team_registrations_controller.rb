class Api::V1::WmbwcTeamRegistrationsController < ApplicationController
  before_action :set_wmbwc_team_registration, only: %i[show update destroy]

  def index
    wmbwc_team_registrations = WmbwcTeamRegistration.order(created_at: :desc)
    render json: wmbwc_team_registrations
  end

  def show
    render json: @wmbwc_team_registration
  end

  def create
    wmbwc_team_registration = WmbwcTeamRegistration.new(wmbwc_team_registration_params)

    if wmbwc_team_registration.save
      render json: wmbwc_team_registration, status: :created
    else
      render json: { errors: wmbwc_team_registration.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @wmbwc_team_registration.update(wmbwc_team_registration_params)
      render json: @wmbwc_team_registration
    else
      render json: { errors: @wmbwc_team_registration.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @wmbwc_team_registration.destroy
    head :no_content
  end

  private

  def set_wmbwc_team_registration
    @wmbwc_team_registration = WmbwcTeamRegistration.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "WMBWC team registration not found" }, status: :not_found
  end

  def wmbwc_team_registration_params
    params.require(:wmbwc_team_registration).permit(
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
