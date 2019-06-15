puts "### Cidades e Estados"
load "db/imports/states_cities.rb"

puts "### Usuario"
User.create name: 'pedro fausto', email: 'pedro.fausto@hotmail.com', username: 'pedro', password: '123456'
User.create name: 'danilo', email: 'danilo@danilo.com', username: 'danilo', password: '123456'

puts "### Client"
FactoryBot.create_list :client, 20
puts "### Product"
FactoryBot.create_list :product, 10
puts "### Order"
FactoryBot.create_list :order, 15
puts "### Payment"
FactoryBot.create_list :payment, 15