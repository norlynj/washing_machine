# Seed Users
User.create(email: 'staff1@example.com', password: 'password', role: :staff, first_name: 'John', last_name: 'Doe', mobile_number: '1234567890', gender: 'Male', birthday: Date.new(1990, 1, 1))
User.create(email: 'staff2@example.com', password: 'password', role: :staff, first_name: 'Jane', last_name: 'Smith', mobile_number: '9876543210', gender: 'Female', birthday: Date.new(1995, 5, 15))
User.create(email: 'manager1@example.com', password: 'password', role: :manager, first_name: 'Manager', last_name: 'One', mobile_number: '1112223333', gender: 'Male', birthday: Date.new(1985, 12, 10))
User.create(email: 'manager2@example.com', password: 'password', role: :manager, first_name: 'Manager', last_name: 'Two', mobile_number: '4445556666', gender: 'Female', birthday: Date.new(1978, 7, 20))

# Seed Customers
Customer.create(name: 'John Doe', address: '123 Main St', contact_info: '123-456-7890')
Customer.create(name: 'Jane Smith', address: '456 Elm St', contact_info: '987-654-3210')

# Seed Orders
Order.create(date_time: DateTime.now, customer: Customer.first, status: 'Pending')
Order.create(date_time: DateTime.now, customer: Customer.second, status: 'Completed')

# Seed Transactions
CustomerTransaction.create(date_time: DateTime.now, amount: 100.0, payment_method: 'Credit Card', order_status: 'Pending', customer: Customer.first)
CustomerTransaction.create(date_time: DateTime.now, amount: 150.0, payment_method: 'PayPal', order_status: 'Completed', customer: Customer.second)

# Seed Invoices
Invoice.create(date_time: DateTime.now, customer_transaction: CustomerTransaction.first)
Invoice.create(date_time: DateTime.now, customer_transaction: CustomerTransaction.second)

# Seed Payments
Payment.create(date_time: DateTime.now, total_amount: 100.0, payment_method: 'Credit Card', payment_status: 'Paid')
Payment.create(date_time: DateTime.now, total_amount: 150.0, payment_method: 'PayPal', payment_status: 'Pending')

# Seed Tasks
Task.create(user: User.where(role: :staff).first, date_range: '2024-04-15 to 2024-04-20')
Task.create(user: User.where(role: :staff).second, date_range: '2024-04-20 to 2024-04-25')