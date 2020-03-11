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
