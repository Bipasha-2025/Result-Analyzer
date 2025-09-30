class DailyResultStat < ApplicationRecord
  validates :date, :subject, :daily_low, :daily_high, :result_count, presence: true
  validates :daily_low, :daily_high, :result_count, numericality: { only_integer: true }
end
