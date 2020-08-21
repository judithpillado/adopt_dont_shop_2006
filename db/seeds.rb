# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Shelters:
alive = Shelter.create!(name: "ALIVE Rescue", address: "1214 W Monroe St", city: "Chicago", state: "IL", zip: 60607)
harmony = Shelter.create!(name: "Harmony House for Cats", address: "2914 N Elston Ave", city: "Chicago", state: "IL", zip: 60607)
paws = Shelter.create!(name: "PAWS Chicago", address: "1997 N Clybourn Ave", city: "Chicago", state: "IL", zip: 60618)
