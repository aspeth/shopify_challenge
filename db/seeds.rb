# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    shoes = Store.create!(name: "Soren's Shoes")
    left_shoe = Item.create!(name: "Left shoe", price: 100, store_id: shoes.id, quantity: 10)
    right_shoe = Item.create!(name: "Right shoe", price: 200, store_id: shoes.id, quantity: 10)