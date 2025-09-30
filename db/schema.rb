# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_09_29_115946) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_result_stats", force: :cascade do |t|
    t.date "date"
    t.string "subject"
    t.integer "daily_low"
    t.integer "daily_high"
    t.integer "result_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date", "subject"], name: "index_daily_result_stats_on_date_and_subject", unique: true
  end

  create_table "monthly_averages", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "subject"
    t.float "avg_low"
    t.float "avg_high"
    t.integer "total_result_count"
    t.integer "days_considered"
    t.datetime "computed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_date", "subject"], name: "index_monthly_averages_on_end_date_and_subject"
  end

  create_table "results", force: :cascade do |t|
    t.string "student_name"
    t.string "subject"
    t.integer "marks"
    t.datetime "submitted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject"], name: "index_results_on_subject"
    t.index ["submitted_at"], name: "index_results_on_submitted_at"
  end

end
