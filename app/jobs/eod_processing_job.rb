class EodProcessingJob < ApplicationJob
  queue_as :default

  def perform(target_date = nil)
    date = (target_date || Date.current).to_date
    start_time = date.beginning_of_day
    end_time = date.end_of_day

    rows = Result.where(submitted_at: start_time..end_time)
                .group(:subject)
                .pluck(
                  :subject,
                  Arel.sql('MIN(marks) as daily_low'),
                  Arel.sql('MAX(marks) as daily_high'),
                  Arel.sql('COUNT(*) as result_count')
                )

    rows.each do |subject, low, high, count|
      stat = DailyResultStat.find_or_initialize_by(date: date, subject: subject)
      stat.daily_low = low.to_i
      stat.daily_high = high.to_i
      stat.result_count = count.to_i
      stat.save!
    end

    if monday_of_week_of_third_wed?(date)
      MonthlyAverageJob.perform_later(date)
    end
  end

  private

  def monday_of_week_of_third_wed?(date)
    first_day = Date.new(date.year, date.month, 1)
    first_wed = first_day
    first_wed += 1 until first_wed.wday == 3
    third_wed = first_wed + 14
    monday_of_that_week = third_wed - 2
    date == monday_of_that_week
  end
end
