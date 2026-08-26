class Api::V1::WmbwcGuestRegistrationsController < ApplicationController
  before_action :set_wmbwc_guest_registration, only: %i[show update destroy]

  def index
    wmbwc_guest_registrations = WmbwcGuestRegistration.order(created_at: :desc)
    render json: wmbwc_guest_registrations
  end

  def show
    render json: @wmbwc_guest_registration
  end

  def create
    wmbwc_guest_registration = WmbwcGuestRegistration.new(wmbwc_guest_registration_params)

    if wmbwc_guest_registration.save
      render json: wmbwc_guest_registration, status: :created
    else
      render json: { errors: wmbwc_guest_registration.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @wmbwc_guest_registration.update(wmbwc_guest_registration_params)
      render json: @wmbwc_guest_registration
    else
      render json: { errors: @wmbwc_guest_registration.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @wmbwc_guest_registration.destroy
    head :no_content
  end

  private

  def set_wmbwc_guest_registration
    @wmbwc_guest_registration = WmbwcGuestRegistration.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "WMBWC guest registration not found" }, status: :not_found
  end

  def wmbwc_guest_registration_params
    params.require(:wmbwc_guest_registration).permit(
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
