class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.string :student_name
      t.string :subject
      t.integer :marks
      t.datetime :submitted_at

      t.timestamps
    end

    add_index :results, :submitted_at
    add_index :results, :subject
  end
end
