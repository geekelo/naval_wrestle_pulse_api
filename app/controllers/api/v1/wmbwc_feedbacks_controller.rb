class Api::V1::WmbwcFeedbacksController < ApplicationController
  before_action :set_wmbwc_feedback, only: %i[show update destroy]

  def index
    wmbwc_feedbacks = WmbwcFeedback.order(created_at: :desc)
    render json: wmbwc_feedbacks
  end

  def show
    render json: @wmbwc_feedback
  end

  def create
    wmbwc_feedback = WmbwcFeedback.new(wmbwc_feedback_params)

    if wmbwc_feedback.save
      render json: wmbwc_feedback, status: :created
    else
      render json: { errors: wmbwc_feedback.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @wmbwc_feedback.update(wmbwc_feedback_params)
      render json: @wmbwc_feedback
    else
      render json: { errors: @wmbwc_feedback.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @wmbwc_feedback.destroy
    head :no_content
  end

  private

  def set_wmbwc_feedback
    @wmbwc_feedback = WmbwcFeedback.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "WMBWC feedback not found" }, status: :not_found
  end

  def wmbwc_feedback_params
    params.require(:wmbwc_feedback).permit(
      :country,
      :airport_reception,
      :movement_to_hotel,
      :hotel_accommodation,
      :feeding,
      :wifi,
      :professionalism_of_reception_team,
      :professionalism_of_hotel_team,
      :general_assessment_so_far,
      :comment
    )
  end
end
