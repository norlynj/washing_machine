# # Seed Users
User.create(email: 'staff1@example.com', password: 'password', role: :staff, first_name: 'John', last_name: 'Doe', mobile_number: '1234567890', gender: 'Male', birthday: Date.new(1990, 1, 1), schedule_array: [0, 1, 1, 1, 1, 1, 0])
User.create(email: 'staff2@example.com', password: 'password', role: :staff, first_name: 'Jane', last_name: 'Smith', mobile_number: '9876543210', gender: 'Female', birthday: Date.new(1995, 5, 15), schedule_array: [0, 1, 1, 1, 1, 1, 0])
User.create(email: 'manager1@example.com', password: 'password', role: :manager, first_name: 'Manager', last_name: 'One', mobile_number: '1112223333', gender: 'Male', birthday: Date.new(1985, 12, 10), schedule_array: [0, 1, 1, 1, 1, 1, 0])
User.create(email: 'manager2@example.com', password: 'password', role: :manager, first_name: 'Manager', last_name: 'Two', mobile_number: '4445556666', gender: 'Female', birthday: Date.new(1978, 7, 20), schedule_array: [0, 1, 1, 1, 1, 1, 0])

# require 'faker'

# I am everywhere
User.create!(
    email: 'francis@mail.com',
    password: 'password',
    role: :manager,
    first_name: 'Francis Lorenzo',
    last_name: 'Espina',
    mobile_number: Faker::PhoneNumber.phone_number,
    gender: Faker::Gender.binary_type,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    schedule_array: [0, 1, 1, 1, 1, 1, 0]
  )


# Seed Users
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password',
    role: :staff,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    mobile_number: Faker::PhoneNumber.phone_number,
    gender: Faker::Gender.binary_type,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    schedule_array: [0, 1, 1, 1, 1, 1, 0]
  )
end


# Seed Customers
10.times do
  Customer.create!(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    contact_info: Faker::PhoneNumber.phone_number
  )
end

# # Seed data for inventories table
# 10.times do
#   Inventory.create(
#     name: Faker::Commerce.product_name,
#     quantity: Faker::Number.between(from: 1, to: 100)
#   )
# end

# # Seed data for orders table
40.times do
  Order.create(
    customer_id: Customer.pluck(:id).sample,
    staff_id: User.pluck(:id).sample,
    status: Faker::Lorem.word,
    weight: Faker::Number.decimal(l_digits: 2),
    payment_method: Faker::Commerce.product_name,
    classification: Faker::Commerce.product_name,
    total_amount: Faker::Number.decimal(l_digits: 2),
    created_at: rand(Time.zone.local(2020, 1, 1)..Time.zone.local(2024, 4, 30))
  )
end

# # Seed data for customer_transactions table
# 10.times do
#   CustomerTransaction.create(
#     customer_id: Customer.pluck(:id).sample,
#     order_id: Order.pluck(:id).sample,
#     receipt: Faker::LoremFlickr.image(size: "300x300")
#   )
# end

# # Seed data for schedules table
# 10.times do
#   Schedule.create(
#     user_id: User.pluck(:id).sample,
#     start_date: Faker::Date.backward(days: 30),
#     end_date: Faker::Date.forward(days: 30)
#   )
# end

# 40.times do
#   Customer.create!(
#     name: Faker::Name.name,
#     address: Faker::Address.full_address,
#     contact_info: Faker::PhoneNumber.phone_number,
#     created_at: rand(Time.zone.local(2020, 1, 1)..Time.zone.local(2024, 4, 30))
#   )
# end
