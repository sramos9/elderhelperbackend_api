# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Elder.create(
    name: Faker::Name.name,

    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.safe_email
  )
end

# 10.times do
#   Task.create(
#     task_name: Faker::Job.field,
#     date_needed: Faker::Date.forward(20),
#     location: Faker::Address.zip,
#     duration: Faker::Commerce.price,
#     details: Faker::Hipster.sentence,
#     phone: Faker::PhoneNumber.phone_number,
#     email: Faker::Internet.safe_email,
#     volunteer_name: '',
#     volunteer_phone: '',
#     volunteer_email: '',
#     elder_id: Faker::Number.between(1, 10)
#   )
# end
