# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "start"
Scene.destroy_all
Place.destroy_all
Movie.destroy_all
User.destroy_all

puts "create first user"
user = User.create(email: "contact@cinehunt", password: "123456")
puts "user created"

joker = Movie.create(title: 'Joker', category: 'Drame')
la_maison_du_mal = Movie.create(title: 'La Maison du mal', category: 'Horreur')
barbie = Movie.create(title: 'Barbie', category: 'Comedie')

new_jersey = Place.create(country: 'USA', city: 'Newark, New Jersey')
los_angeles = Place.create(country: 'USA', city: 'Los Angeles')
hertfordshire = Place.create(country: 'Royaume-Uni', city: 'Hertfordshire')
bronx = Place.create(country: 'USA', city: 'Bronx')

Scene.create(
  movie: joker,
  place: new_jersey,
  user: user,
  title: "Loew's Jersey Theatre",
  content: "C’est ici qu’Arthur Fleck descend le tapis rouge en faisant des cabrioles",
  rating: 4.4,
  price: "9€",
)

Scene.create(
  movie: joker,
  place: bronx,
  user: user,
  title: "Les escaliers du Joker",
  content: "Le célèbre escalier qui illustre l'affiche du film",
  price: "Gratuit"
)

Scene.create(
  movie: joker,
  place: new_jersey,
  title: "The Paramount Theater",
  content: "Abandonné depuis, "
)
