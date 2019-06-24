puts "### Cidades e Estados"
load "db/imports/states_cities.rb"

puts "### Usuario"
User.create email: 'pedro.fausto@hotmail.com', username: 'pedro', password: '123456', roles_mask: 1
User.create email: 'danilo@danilo.com', username: 'danilo', password: '123456', roles_mask: 1
User.create email: 'teste@teste.com', username: 'teste', password: '123456', roles_mask: 2

puts "### Client"
FactoryBot.create_list :client, 20
puts "### Product"
FactoryBot.create_list :product, 10
puts "### Order"
FactoryBot.create_list :order, 15
puts "### Payment"
FactoryBot.create_list :payment, 15