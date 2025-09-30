class CreateDailyResultStats < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_result_stats do |t|
      t.date :date
      t.string :subject
      t.integer :daily_low
      t.integer :daily_high
      t.integer :result_count

      t.timestamps
    end

    add_index :daily_result_stats, [:date, :subject], unique: true
  end
end
