class Schedule < ApplicationRecord
  # Method to get the weekdays as an array of integers
  def user_sched_array
    user_sched.to_s(2).rjust(7, '0').chars.map(&:to_i)
  end

  # Method to set the weekdays from an array of integers
  def user_sched_array=(array)
    self.user_sched = array.join.to_i(2)
  end
end