class CreateMonthlyAverages < ActiveRecord::Migration[7.1]
  def change
    create_table :monthly_averages do |t|
      t.date :start_date
      t.date :end_date
      t.string :subject
      t.float :avg_low
      t.float :avg_high
      t.integer :total_result_count
      t.integer :days_considered
      t.datetime :computed_at

      t.timestamps
    end

    add_index :monthly_averages, [:end_date, :subject]
  end
end
