class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add new attributes to the Devise permitted parameters
  validates :first_name, :last_name, :mobile_number, :gender, :birthday, presence: true
  enum role: { staff: 0, manager: 1 }, _prefix: true


  def manager?
      role == "manager"
  end

  def staff?
    role == "staff"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def schedule_array
    schedule.to_s(2).rjust(7, '0').chars.map(&:to_i)
  end

  # Method to set the weekdays from an array of integers
  def schedule_array=(array)
    self.schedule = array.join.to_i(2)
  end

end



