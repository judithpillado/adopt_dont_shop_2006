require "rails_helper"

RSpec.describe "Shelter Pet Creation" do

  it "As a visitor, I see a link to add a new adoptable pet for that shelter 'Create Pet'. When I click on the link, I'm taken to '/shelters/:shelter_id/pets' where a new pet is created for that shelter and that pet has a status of 'adoptable'. I am redirected to the Shelter Pets Index page where I can see the new pet listed." do
    before(:each) do
      @alive = Shelter.create!(name: "ALIVE Rescue", address: "1214 W Monroe St", city: "Chicago", state: "IL", zip: 60607)
      @harmony = Shelter.create!(name: "Harmony House for Cats", address: "2914 N Elston Ave", city: "Chicago", state: "IL", zip: 60607)
      @paws = Shelter.create!(name: "PAWS Chicago", address: "1997 N Clybourn Ave", city: "Chicago", state: "IL", zip: 60618)

      @diabla = @alive.pets.create!(name: "Diabla", image: "https://files.slack.com/files-pri/T029P2S9M-F0174DQK1M5/20200630_120130.jpg", description: "Mixed breed; Black German Sheperd with Rottweiler. She's very friendly but needs training!", age: 3, sex: "Female", current_shelter: "ALIVE Rescue", adoption_status: "Adoptable")
      @prieto = @harmony.pets.create!(name: "Prieto", image: "https://www.thesprucepets.com/thmb/-UHyBMUvHaMyFuCPWRnoYgLhVgA=/2304x1296/smart/filters:no_upscale()/close-up-of-cat-lying-on-floor-at-home-908763830-1d61bee6961b45ee8a55bdfa5da1ebb3.jpg", description: "Feisty black cat that loves attacking human feet while walking, just minding their business.", age: 3, sex: "Male", current_shelter: "Harmony House for Cats", adoption_status: "Pending")
      @gordo = @paws.pets.create!(name: "Gordo", image: "https://www.treehugger.com/thmb/xG5q0YBTTGuLVIVpiCD8eohv3AE=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2017__04__lop-earred-rabbit-d47323a1ab3847398463b3d6a1d7119b.jpg", description: "Very cute lop bunny! He has a lot of energy and loves to hop all day.", age: 5, sex: "Male", current_shelter: "PAWS Chicago", adoption_status: "Adoptable")
    end
    visit "/shelters/#{@paws.id}/pets"
    expect(page).to have_link("Create a Pet!")
    click_link "Create a Pet!"
    expect(current_path).to eq("/shelters/#{@paws.id}/pets/new")

    name = "First of the Month"
    image = 350
    description = 7689823
    age =
    sex = 

    expect(page).to have_content("Create a New Pet")
    fill_in :name, with: "Felines & Canines"
    fill_in :image, with: "6379 N Paulina St"
    fill_in :description, with: "Chicago"
    fill_in :age, with: "IL"
    fill_in :sex, with: 60660

    click_button "Create Shelter"
    expect(current_path).to eq("/shelters")
    expect(page).to have_content("Felines & Canines")
  end
end

# User Story 10, Shelter Pet Creation
#
# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
