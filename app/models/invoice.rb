class Invoice < ApplicationRecord
  belongs_to :customer_transaction
end
