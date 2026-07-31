class Api::V1::DhqyscGuestRegistrationsController < ApplicationController
  before_action :set_dhqysc_guest_registration, only: %i[show update destroy]

  def index
    dhqysc_guest_registrations = DhqyscGuestRegistration.order(created_at: :desc)
    render json: dhqysc_guest_registrations
  end

  def show
    render json: @dhqysc_guest_registration
  end

  def create
    dhqysc_guest_registration = DhqyscGuestRegistration.new(dhqysc_guest_registration_params)

    if dhqysc_guest_registration.save
      render json: dhqysc_guest_registration, status: :created
    else
      render json: { errors: dhqysc_guest_registration.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @dhqysc_guest_registration.update(dhqysc_guest_registration_params)
      render json: @dhqysc_guest_registration
    else
      render json: { errors: @dhqysc_guest_registration.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @dhqysc_guest_registration.destroy
    head :no_content
  end

  private

  def set_dhqysc_guest_registration
    @dhqysc_guest_registration = DhqyscGuestRegistration.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "DHQYSC guest registration not found" }, status: :not_found
  end

  def dhqysc_guest_registration_params
    params.require(:dhqysc_guest_registration).permit(
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
