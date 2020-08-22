require "rails_helper"

RSpec.describe "Shelter Pet Index Page" do

  before(:each) do
    @alive = Shelter.create!(name: "ALIVE Rescue", address: "1214 W Monroe St", city: "Chicago", state: "IL", zip: 60607)
    @harmony = Shelter.create!(name: "Harmony House for Cats", address: "2914 N Elston Ave", city: "Chicago", state: "IL", zip: 60607)
    @paws = Shelter.create!(name: "PAWS Chicago", address: "1997 N Clybourn Ave", city: "Chicago", state: "IL", zip: 60618)

    @diabla = @alive.pets.create!(name: "Diabla", image: "https://bauerfrodoprod-cdn.azureedge.net/uploads/e3bb5459-077e-4633-a793-c6056dacb89e-ls4618_42_gi_172600883.jpg", age: 3, sex: "Female",  current_shelter: "ALIVE Rescue")
    @prieto = @harmony.pets.create!(name: "Prieto", image: "https://www.thesprucepets.com/thmb/-UHyBMUvHaMyFuCPWRnoYgLhVgA=/2304x1296/smart/filters:no_upscale()/close-up-of-cat-lying-on-floor-at-home-908763830-1d61bee6961b45ee8a55bdfa5da1ebb3.jpg", age: 3, sex: "Male",  current_shelter: "Harmony House for Cats")
    @simba = @harmony.pets.create!(name: "Simba", image: "https://s7d2.scene7.com/is/image/TWCNews/generic_kitten_jpg", age: 1, sex: "Female",  current_shelter: "Harmony House for Cats")
    @gordo = @paws.pets.create!(name: "Gordo", image: "https://www.treehugger.com/thmb/xG5q0YBTTGuLVIVpiCD8eohv3AE=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2017__04__lop-earred-rabbit-d47323a1ab3847398463b3d6a1d7119b.jpg", age: 5, sex: "Male",  current_shelter: "PAWS Chicago")
  end

  it "As a visitor, when I visit '/shelters/:shelter_id/pets', I see each pet that can be adopted from that shelter with that shelter_id including the pet's information." do

    visit "/shelters/#{@harmony.id}/pets"

    expect(page).to have_content(@prieto.name)
    expect(page).to have_css("img[src=\"#{@prieto.image}\"]")
    expect(page).to have_content(@prieto.age)
    expect(page).to have_content(@prieto.sex)

    expect(page).to have_content(@simba.name)
    expect(page).to have_css("img[src=\"#{@simba.image}\"]")
    expect(page).to have_content(@simba.age)
    expect(page).to have_content(@simba.sex)

    expect(page).to_not have_content(@gordo.name)
  end

end
