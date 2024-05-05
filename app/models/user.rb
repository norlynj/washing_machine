class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add new attributes to the Devise permitted parameters
  validates :first_name, :last_name, :mobile_number, :gender, :birthday, presence: true
  enum role: { staff: 0, manager: 1 }, _prefix: true
end
