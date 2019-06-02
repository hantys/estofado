puts "### Cidades e Estados"
load "db/imports/states_cities.rb"

puts "### Usuario"
User.create email: 'pedro.fausto@hotmail.com', username: 'pedro', password: '12345678'

puts "### Client"
FactoryBot.create_list :client, 20
puts "### Product"
FactoryBot.create_list :product, 10
puts "### Order"
FactoryBot.create_list :order, 15
puts "### Payment"
FactoryBot.create_list :payment, 15