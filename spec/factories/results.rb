FactoryBot.define do
  factory :result do
    student_name { "John Doe" }
    subject      { "Math" }
    marks        { 50 }
    submitted_at { Time.current }
  end
end
