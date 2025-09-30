require 'rails_helper'

RSpec.describe MonthlyAverage, type: :model do
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:avg_low) }
  it { should validate_presence_of(:avg_high) }
  it { should validate_presence_of(:total_result_count) }
  it { should validate_presence_of(:days_considered) }
  it { should validate_presence_of(:computed_at) }
end
