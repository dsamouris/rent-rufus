class Booking < ApplicationRecord
  belongs_to :dog
  belongs_to :user

  # validates :start_date, comparison: { less_than: :end_date }
end
