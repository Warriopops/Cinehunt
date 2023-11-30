# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
ActiveRecord::Base.connection.disable_referential_integrity do

puts "start"
Scene.destroy_all
Place.destroy_all
Movie.destroy_all
User.destroy_all

puts "create first user"
user = User.create!(email: "contact@cinehunt.com", password: "123456", username: "Bob", level: 30, certification: true)
puts "user created"

joker = Movie.create!(title: 'Joker', category: 'Drame')
conjuring = Movie.create!(title: 'Conjuring', category: 'Horreur')
barbie = Movie.create!(title: 'Barbie', category: 'Comedie')

new_jersey = Place.create!(country: 'USA', city: 'Newark, New Jersey')
los_angeles = Place.create!(country: 'USA', city: 'Los Angeles')
burrillville= Place.create!(country: 'USA', city: 'Burillville')
bronx = Place.create!(country: 'USA', city: 'Bronx')

Scene.create(
  movie: joker,
  place: new_jersey,
  user: user,
  title: "Loew's Jersey Theatre",
  content: "C’est ici qu’Arthur Fleck descend le tapis rouge en faisant des cabrioles",
  rating: 4.4,
  price: "9€"
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
  content: "C'est ici qu'Arthur Fleck a été dupé par des adolescents alors qu'il travaillait en tant que clown devant le Newark Paramount Theater.",
  price: "Gratuit"
)

Scene.create(
  movie: conjuring,
  place: burrillville,
  title: "The Conjuring House",
  content: "La célèbre maison de Ed et Lorren Warren qui ont inspiré le célèbre film Conjuring.",
  rating: 4.9,
  price: "25-30€"
)

Scene.create(
  movie: barbie,
  place: los_angeles,
  title: "Venice Beach",
  content: "Barbie à Venice Beach, un lieu dynamique qui reflète la diversité culturelle du monde réel.",
  price: "Gratuit"
)
end
