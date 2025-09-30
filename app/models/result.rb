class Result < ApplicationRecord
  validates :student_name, :subject, :submitted_at, presence: true
  validates :marks, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :for_date, ->(d) { where(submitted_at: d.beginning_of_day..d.end_of_day) }
end
