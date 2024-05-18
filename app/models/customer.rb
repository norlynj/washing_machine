class Customer < ApplicationRecord
  has_many :orders
  scope :created_today, -> { where("DATE(created_at) = ?", Date.today) }
end
