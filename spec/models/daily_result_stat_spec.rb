require 'rails_helper'

RSpec.describe DailyResultStat, type: :model do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:daily_low) }
  it { should validate_presence_of(:daily_high) }
  it { should validate_presence_of(:result_count) }
  it { should validate_numericality_of(:daily_low).only_integer }
  it { should validate_numericality_of(:daily_high).only_integer }
  it { should validate_numericality_of(:result_count).only_integer }
end
