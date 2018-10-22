# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shop = Shop.create(name: 'Shopify Demo Store', email: 'contact@storedomain.com')

product_one = Product.create(name: 'Yellow Tee', price:7.00, shop: shop)
product_two = Product.create(name: 'Black Tee', price:19.99, shop: shop)

order = Order.create(customer_name: 'Jane Doe', shop: shop)

line_item_one = LineItem.create(product_id:product_one.id, price:14.00, quantity:2, order: order)
line_item_two = LineItem.create(product_id:product_two.id, price: 19.99, quantity:1, order: order)
