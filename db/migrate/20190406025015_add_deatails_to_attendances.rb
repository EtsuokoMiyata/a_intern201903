class AddDeatailsToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :scheduled_end_time, :datetime
    add_column :attendances, :processing_content, :string
    add_column :attendances, :instructor_confirm_overtime, :integer
    add_column :attendances, :to_user_overtime, :integer
    add_column :attendances, :next_day, :boolean
    add_column :attendances, :note_chenging, :string
    add_column :attendances, :instructor_confirma_chenging, :integer
    add_column :attendances, :approval_date, :date
    add_column :attendances, :to_user_chenge, :integer
  end
end
