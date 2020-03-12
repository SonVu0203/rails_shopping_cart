# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Shop.create!(name:  "Store 01",
             email: "store@gmail.com",
             phone: "0981234567",
             address: "11 tan tru",
             description: "Cua hang quan ao",
             tax_code: "123456",
             password:              "123456",
             password_confirmation: "123456",
             activated: true,
             activated_at: Time.zone.now)
3.times do |n|
  name = "Store#{Faker::Number.decimal_part(digits: 2)}"
  email = "store#{n+1}@gmail.com"
  phone = "09#{Faker::Number.number(digits: 8)}"
  address = "1#{n+1} Tan Tru"
  description = "Cua hang quan ao"
  tax_code = Faker::Number.number(digits: 6)
  password = "123456"

  Shop.create!(name: name, email: email, phone: phone, address: address, description: description, tax_code: tax_code, password: password, password_confirmation: password)
end

shop = Shop.order(:id).take(5)

10.times do
  name = Faker::Device.model_name
  description = Faker::Device.serial
  price = Faker::Number.decimal(r_digits: 2)
  shop.each { |shop| shop.products.create!(name: name, description: description, price: price)}
end

10.times do
  name = Faker::Device.manufacturer
  shop.each { |shop| shop.categories.create!(name: name)}
end
