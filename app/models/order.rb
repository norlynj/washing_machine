class Order < ApplicationRecord
  belongs_to :customer
  scope :created_today, -> { where("DATE(created_at) = ?", Date.today) }
  belongs_to :staff, class_name: 'User'

  validates :customer_id, presence: true
  validates :status, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  after_update :trigger_pickup_notification, if: :status_changed_to_for_pickup?
  after_create :decrement_inventory

  # Other validations, associations, and methods can be added here
  def staff
    User.find(staff_id)
  end


  private

  def status_changed_to_for_pickup?
    saved_change_to_status? && status == "For Pick-up"
  end

  def trigger_pickup_notification
    puts "Order ##{id} is now ready for pick-up!"
    from_number = customer.contact_info
    boot_twilio
    sms = @client.messages.create(
      from: '+17817806982',
      to: '+639564357630', #customer.contact_info
      body: "Your laundry is now ready for pick-up"
    )
  end

  def boot_twilio
    account_sid ='ACeaf66da2c41ac22570c6588e2d9c4b8b'
    auth_token = '950957c09c3c4b55eccad5296aeffd37'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def decrement_inventory
    @detergent = Inventory.find_by(name: "Detergent")
    @detergent.update(quantity: @detergent.quantity - detergent)
  end
end