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

# Pets:
diabla = alive.pets.create!(name: "Diabla", image: "https://files.slack.com/files-pri/T029P2S9M-F0174DQK1M5/20200630_120130.jpg", description: "Mixed breed; Black German Sheperd with Rottweiler. She's very friendly but needs training!", age: 3, sex: "Female", current_shelter: "ALIVE Rescue", adoption_status: "Adoptable")
prieto = harmony.pets.create!(name: "Prieto", image: "https://www.thesprucepets.com/thmb/-UHyBMUvHaMyFuCPWRnoYgLhVgA=/2304x1296/smart/filters:no_upscale()/close-up-of-cat-lying-on-floor-at-home-908763830-1d61bee6961b45ee8a55bdfa5da1ebb3.jpg", description: "Feisty black cat that loves attacking human feet while walking, just minding their business.", age: 3, sex: "Male", current_shelter: "Harmony House for Cats", adoption_status: "Pending")
gordo = paws.pets.create!(name: "Gordo", image: "https://www.treehugger.com/thmb/xG5q0YBTTGuLVIVpiCD8eohv3AE=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2017__04__lop-earred-rabbit-d47323a1ab3847398463b3d6a1d7119b.jpg", description: "Very cute lop bunny! He has a lot of energy and loves to hop all day.", age: 5, sex: "Male", current_shelter: "PAWS Chicago", adoption_status: "Adoptable")
