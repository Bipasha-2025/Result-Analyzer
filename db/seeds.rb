# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Result.destroy_all
DailyResultStat.destroy_all
MonthlyAverage.destroy_all

puts "🌱 Seeding MSM test results..."

today = Time.zone.today

Result.create!(
  student_name: "Alice",
  subject: "Math",
  marks: 85,
  submitted_at: today.beginning_of_day + 10.hours
)

Result.create!(
  student_name: "Bob",
  subject: "Math",
  marks: 55,
  submitted_at: today.beginning_of_day + 12.hours
)

Result.create!(
  student_name: "Charlie",
  subject: "Science",
  marks: 92,
  submitted_at: today.beginning_of_day + 14.hours
)

Result.create!(
  student_name: "Diana",
  subject: "Science",
  marks: 72,
  submitted_at: today.beginning_of_day + 16.hours
)

puts "✅ Seeded #{Result.count} results"
