class Viewing < ActiveRecord::Base
  belongs_to :user
  belongs_to :house

  validates :appointment_date, presence: true
  validates :appointment_time, presence: true

  TIMINGS = ['Morning', 'Afternoon', 'Evening', 'Night']
end
