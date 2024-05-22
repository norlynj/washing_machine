class User < ApplicationRecord
  after_create :initialize_schedule_array
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add new attributes to the Devise permitted parameters
  validates :first_name, :last_name, :mobile_number, :gender, :birthday, presence: true
  validates :mobile_number, format: { with: /\A\d{11}\z/, message: "must be 11 digits" }
  validates :mobile_number, uniqueness: true
  enum role: { staff: 0, manager: 1 }, _prefix: true
  has_many :orders


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

  private

  def initialize_schedule_array
    update(schedule_array: [0, 0, 0, 0, 0, 0, 0])
  end

end



