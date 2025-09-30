require 'rails_helper'

RSpec.describe MonthlyAverageJob, type: :job do
  it "picks minimal days >=5 until total result_count >= 200 and computes averages" do
    end_date = Date.new(2025,9,29)
    10.times do |i|
      d = end_date - i.days
      DailyResultStat.create!(
        date: d,
        subject: "Math",
        daily_low: 10 + i,
        daily_high: 90 - i,
        result_count: 30
      )
    end

    MonthlyAverageJob.perform_now(end_date)
    ma = MonthlyAverage.where(end_date: end_date, subject: "Math").last
    expect(ma).not_to be_nil
    expect(ma.days_considered).to be >= 5
    expect(ma.total_result_count).to be >= 200
    expect(ma.days_considered).to eq(7)
  end
end
