class CreateOvertimes < ActiveRecord::Migration[5.1]
  def change
    create_table :overtimes do |t|
      t.datetime :scheduled_end_time
      t.string :processing_content
      t.string :Instructor_confirmation
      t.integer :to_user
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
