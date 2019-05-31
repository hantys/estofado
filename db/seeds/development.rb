puts "### Cidades e Estados"
load "db/imports/states_cities.rb"

puts "### Usuario"
User.create email: 'pedro.fausto@hotmail.com', username: 'pedro', password: '12345678'
# puts "### Itens do orcamento"
# load "db/imports/product.rb"