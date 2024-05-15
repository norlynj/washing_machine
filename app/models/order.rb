class Order < ApplicationRecord
  belongs_to :customer

  def staff
    User.find(staff_id)
  end
end
