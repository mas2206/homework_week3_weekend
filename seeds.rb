require('pry')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({"name" => "Zsolt", "funds" => 25})
customer2 = Customer.new({"name" => "Darren", "funds" => 50})
customer3 = Customer.new({"name" => "John", "funds" => 100})

customer1.save()
customer2.save()
customer3.save()

film1 = Film.new({"title" => "Alien", "price" => 10})
film2 = Film.new({"title" => "Predator", "price" => 15})
film3 = Film.new({"title" => "Pulp Fiction", "price" => 20})
film4 = Film.new({"title" => "Drive", "price" => 25})
film5 = Film.new({"title" => "Gladiator", "price" => 30})

film1.save()
film2.save()
film3.save()
film4.save()
film5.save()

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
ticket2 = Ticket.new({"customer_id" => customer2.id, "film_id" => film2.id})
ticket3 = Ticket.new({"customer_id" => customer2.id, "film_id" => film3.id})
ticket4 = Ticket.new({"customer_id" => customer3.id, "film_id" => film4.id})
ticket5 = Ticket.new({"customer_id" => customer3.id, "film_id" => film5.id})

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()



binding.pry
nil