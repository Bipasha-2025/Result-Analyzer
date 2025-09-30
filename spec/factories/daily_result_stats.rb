FactoryBot.define do
  factory :daily_result_stat do
    date { "2025-09-29" }
    subject { "MyString" }
    daily_low { 1 }
    daily_high { 1 }
    result_count { 1 }
  end
end
