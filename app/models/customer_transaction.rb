class CustomerTransaction < ApplicationRecord
  belongs_to :customer
  has_one :invoice
end
