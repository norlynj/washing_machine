class Customer < ApplicationRecord
  has_many :orders
  validates :contact_info, format: { with: /\A\d{11}\z/, message: "must be 11 digits" }
  scope :created_today, -> { where("DATE(created_at) = ?", Date.today) }
end
