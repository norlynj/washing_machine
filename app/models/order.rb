class Order < ApplicationRecord
  belongs_to :customer
  scope :created_today, -> { where("DATE(created_at) = ?", Date.today) }
  def staff
    User.find(staff_id)
  end
end
