class RemoveStartDateAndEndDateFromSchedules < ActiveRecord::Migration[7.1]
  def change
    if column_exists?(:schedules, :start_date)
      remove_column :schedules, :start_date, :date
    end

    if column_exists?(:schedules, :end_date)
      remove_column :schedules, :end_date, :date
    end
  end
end