class GuestRegistrationsController < ApplicationController
  before_action :set_guest_registration, only: %i[show update destroy]

  def index
    guest_registrations = GuestRegistration.order(created_at: :desc)
    render json: guest_registrations
  end

  def show
    render json: @guest_registration
  end

  def create
    guest_registration = GuestRegistration.new(guest_registration_params)

    if guest_registration.save
      render json: guest_registration, status: :created
    else
      render json: { errors: guest_registration.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @guest_registration.update(guest_registration_params)
      render json: @guest_registration
    else
      render json: { errors: @guest_registration.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @guest_registration.destroy
    head :no_content
  end

  private

  def set_guest_registration
    @guest_registration = GuestRegistration.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Guest registration not found" }, status: :not_found
  end

  def guest_registration_params
    params.require(:guest_registration).permit(
      :country,
      :full_name,
      :rank_title,
      :organization_unit,
      :appointment,
      :travel_mode,
      :accommodation
    )
  end
end
