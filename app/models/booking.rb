class Booking < ApplicationRecord
  belongs_to :dog
  belongs_to :user

  # validates_with BookingValidator, on: :create
  # validates :end_date, numericality: { greater_than_or_equal_to: :start_date }

  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    if end_date < start_date
      errors.add(:end_date, "You cannot time travel. Please select an end date after the start date.")
    end
  end
end
