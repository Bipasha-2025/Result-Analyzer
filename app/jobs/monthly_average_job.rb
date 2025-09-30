class MonthlyAverageJob < ApplicationJob
  queue_as :default

  def perform(end_date = nil)
    end_date = (end_date || Date.current).to_date

    subjects = DailyResultStat.where("date <= ?", end_date).distinct.pluck(:subject)

    subjects.each do |subject|
      stats = DailyResultStat.where(subject: subject).where("date <= ?", end_date).order(date: :desc)

      selected_days = []
      total_count = 0

      stats.each do |s|
        selected_days << s
        total_count += s.result_count
        break if total_count >= 200 && selected_days.size >= 5
      end

      next if selected_days.size < 5

      start_date = selected_days.last.date
      days_considered = selected_days.size
      avg_high = selected_days.sum(&:daily_high).to_f / days_considered
      avg_low = selected_days.sum(&:daily_low).to_f / days_considered

      MonthlyAverage.create!(
        start_date: start_date,
        end_date: end_date,
        subject: subject,
        avg_low: avg_low,
        avg_high: avg_high,
        total_result_count: total_count,
        days_considered: days_considered,
        computed_at: Time.current
      )
    end
  end
end
