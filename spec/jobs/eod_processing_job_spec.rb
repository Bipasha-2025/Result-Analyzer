require 'rails_helper'

RSpec.describe EodProcessingJob, type: :job do
  it "aggregates results into daily stats" do
    date = Time.zone.today
    FactoryBot.create(:result, subject: "Math", marks: 10, submitted_at: date.beginning_of_day + 1.hour)
    FactoryBot.create(:result, subject: "Math", marks: 90, submitted_at: date.beginning_of_day + 2.hour)
    FactoryBot.create(:result, subject: "Math", marks: 50, submitted_at: date.beginning_of_day + 3.hour)

    EodProcessingJob.perform_now(date)

    stat = DailyResultStat.find_by(date: date, subject: "Math")
    expect(stat).not_to be_nil
    expect(stat.daily_low).to eq(10)
    expect(stat.daily_high).to eq(90)
    expect(stat.result_count).to eq(3)
  end
end
