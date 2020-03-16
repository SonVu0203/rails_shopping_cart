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
# ---------- render shop
# 1.times do |n|
#   name = "Store#{Faker::Number.decimal_part(digits: 2)}"
#   email = "store#{n+1}@gmail.com"
#   phone = "09#{Faker::Number.number(digits: 8)}"
#   address = "1#{n+1} Tan Tru"
#   description = "Cua hang quan ao"
#   tax_code = Faker::Number.number(digits: 6)
#   password = "123456"
#
#   Shop.create!(name: name, email: email, phone: phone, address: address, description: description, tax_code: tax_code, password: password, password_confirmation: password)
# end


shops = Shop.order(:id).take(5)
# ---------- render category

5.times do
  name = Faker::Device.manufacturer
  shops.each { |shop| shop.categories.create!(name: name)}
end
# ---------- render product


10.times do
  name = Faker::Device.model_name
  description = "Căn hộ 1 phòng ngủ Vinhomes Central Park"
  price = Faker::Number.decimal(r_digits: 2)
  category_ids = Faker::Number.between(from: 1, to: 5)
  shops.each { |shop| shop.products.create!(name: name, description: description, price: price, category_ids: category_ids)}
end
# ---------- render image for product

products = Product.order(:id)

1.times do
  img_src = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQN_qcly4wZL66xPFC69LDkU_mB14WoCRcCiXG6pp-m7N0caOsy"
  products.each { |p| Image.create!(imageable: p, img_src: img_src)}
end

# ---------- render product for category
categories = Category.order(:id)
5.times do
  categories.each { |p| ProductsCategory.create!(product_id: "#{Faker::Number.between(from: 1, to: 5)}", category_id: p.id)}
end


