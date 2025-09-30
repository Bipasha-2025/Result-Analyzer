class MonthlyAverage < ApplicationRecord
  validates :start_date, :end_date, :subject, :avg_low, :avg_high, :total_result_count, :days_considered, :computed_at, presence: true
end
