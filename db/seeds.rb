# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"
ActiveRecord::Base.connection.disable_referential_integrity do

puts "start"
Scene.destroy_all
Place.destroy_all
Movie.destroy_all
User.destroy_all

user = User.create!(email: "barbara@cinehunt.fr", password: "123456", username: "Barbara le jedi", level: 30, certification: true)
puts "user Barbara created"
user1 = User.create!(email: "lilian@cinehunt.fr", password: "123456", username: "Lilian le padawan", level: 1, certification: false)
puts "user Lilian created"
user2 = User.create!(email: "hilam@cinehunt.fr", password: "123456", username: "Hilam le jedi", level: 30, certification: true)
puts "user Hilam created"
user3 = User.create!(email: "thomas@cinehunt.fr", password: "123456", username: "Thomas le jedi", level: 30, certification: true)
puts "user Thomas created"

joker = Movie.create!(title: 'Joker', category: 'Drame')
conjuring = Movie.create!(title: 'Conjuring', category: 'Horreur')
barbie = Movie.create!(title: 'Barbie', category: 'Comedie')

new_jersey = Place.create!(country: 'USA', city: 'Newark, New Jersey')
los_angeles = Place.create!(country: 'USA', city: 'Los Angeles')
burrillville = Place.create!(country: 'USA', city: 'Burillville')
bronx = Place.create!(country: 'USA', city: 'Bronx')

loew_jersey = Scene.new(
  movie: joker,
  place: new_jersey,
  user: user,
  title: "Loew's Jersey Theatre",
  content: "C'est ici qu'Arthur Fleck descend le tapis rouge en faisant des cabrioles",
  rating: 4.4,
  price: "9€"
)
loew_jersey.photo.attach(io: URI.open("https://jerseydigs.com/wp-content/uploads/2021/02/Loews-Jersey-Theatre-Journal-Square-Jersey-City-1.jpg"), filename: "loew_jersey.png", content_type: "image/png")
loew_jersey.save!

escaliers = Scene.new(
  movie: joker,
  place: bronx,
  user: user1,
  title: "Les escaliers",
  content: "Le célèbre escalier qui illustre l'affiche du film",
  price: "Gratuit"
)
escaliers.photo.attach(io: URI.open("https://fr.web.img4.acsta.net/r_654_368/newsv7/19/10/24/14/31/2884301.jpg"), filename: "escaliers.png", content_type: "image/png")
escaliers.save!

paramount_theater = Scene.new(
  movie: joker,
  place: new_jersey,
  title: "The Paramount Theater",
  content: "C'est ici qu'Arthur Fleck a été dupé par des adolescents alors qu'il travaillait en tant que clown devant le Newark Paramount Theater.",
  price: "Gratuit"
)
paramount_theater.photo.attach(io: URI.open("https://advancelocal-adapter-image-uploads.s3.amazonaws.com/image.nj.com/home/njo-media/width2048/img/essex_impact/photo/2018/10/12/24954100-standard.jpg"), filename: "paramount_theater.png", content_type: "image/png")
paramount_theater.save!

conjuring = Scene.new(
  movie: conjuring,
  place: burrillville,
  title: "The Conjuring House",
  content: "La célèbre maison de Ed et Lorren Warren qui ont inspiré le célèbre film Conjuring.",
  rating: 4.9,
  price: "25-30€"
)
conjuring.photo.attach(io: URI.open("https://imageio.forbes.com/specials-images/imageserve/629003d4d07c7f069f74921f/Haunted-House--Colonial-house/960x0.jpg?format=jpg&width=960https://i.dailymail.co.uk/1s/2022/06/28/05/59606005-10959397-image-a-73_1656392097884.jpg"), filename: "conjuring.png", content_type: "image/png")
conjuring.save!

venice_beach = Scene.create(
  movie: barbie,
  place: los_angeles,
  title: "Venice Beach",
  content: "Barbie à Venice Beach, un lieu dynamique qui reflète la diversité culturelle du monde réel.",
  price: "Gratuit"
)
venice_beach.photo.attach(io: URI.open("https://i.dailymail.co.uk/1s/2022/06/28/05/59606005-10959397-image-a-73_1656392097884.jpg"), filename: "venice_beach.png", content_type: "image/png")
venice_beach.save!
end
