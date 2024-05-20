class AddUserScheduleToSchedules < ActiveRecord::Migration[7.1]
  def change
    add_column :schedules, :user_sched, :integer
  end
end
