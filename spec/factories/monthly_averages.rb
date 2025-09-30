FactoryBot.define do
  factory :monthly_average do
    start_date { "2025-09-29" }
    end_date { "2025-09-29" }
    subject { "MyString" }
    avg_low { 1.5 }
    avg_high { 1.5 }
    total_result_count { 1 }
    days_considered { 1 }
    computed_at { "2025-09-29 17:29:46" }
  end
end
