class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :staff, class_name: 'User'

  validates :customer_id, presence: true
  validates :status, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Other validations, associations, and methods can be added here
  def staff
    User.find(staff_id)
  end
end
