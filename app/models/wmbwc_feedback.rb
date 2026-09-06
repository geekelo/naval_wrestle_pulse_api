class WmbwcFeedback < ApplicationRecord
  RATING_RANGE = (1..5).freeze

  validates :country, presence: true
  validates :airport_reception,
            :movement_to_hotel,
            :hotel_accommodation,
            :feeding,
            :wifi,
            :professionalism_of_reception_team,
            :professionalism_of_hotel_team,
            :general_assessment_so_far,
            presence: true,
            inclusion: { in: RATING_RANGE, message: "must be between 1 and 5" }
end
