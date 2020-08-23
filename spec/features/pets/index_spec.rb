require "rails_helper"

RSpec.describe "Pet Index Page" do

  before(:each) do
    @alive = Shelter.create!(name: "ALIVE Rescue", address: "1214 W Monroe St", city: "Chicago", state: "IL", zip: 60607)
    @harmony = Shelter.create!(name: "Harmony House for Cats", address: "2914 N Elston Ave", city: "Chicago", state: "IL", zip: 60607)
    @paws = Shelter.create!(name: "PAWS Chicago", address: "1997 N Clybourn Ave", city: "Chicago", state: "IL", zip: 60618)

    @diabla = @alive.pets.create!(name: "Diabla", image: "https://files.slack.com/files-pri/T029P2S9M-F0174DQK1M5/20200630_120130.jpg", age: 3, sex: "Female",  current_shelter: "ALIVE Rescue")
    @prieto = @harmony.pets.create!(name: "Prieto", image: "https://www.thesprucepets.com/thmb/-UHyBMUvHaMyFuCPWRnoYgLhVgA=/2304x1296/smart/filters:no_upscale()/close-up-of-cat-lying-on-floor-at-home-908763830-1d61bee6961b45ee8a55bdfa5da1ebb3.jpg", age: 3, sex: "Male",  current_shelter: "Harmony House for Cats")
    @gordo = @paws.pets.create!(name: "Gordo", image: "https://www.treehugger.com/thmb/xG5q0YBTTGuLVIVpiCD8eohv3AE=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2017__04__lop-earred-rabbit-d47323a1ab3847398463b3d6a1d7119b.jpg", age: 5, sex: "Male",  current_shelter: "PAWS Chicago")
  end

  it "As a visitor, I can see all the pets in the system along with their information." do

    visit "/pets"
    expect(page).to have_link(@diabla.name)
    expect(page).to have_css("img[src=\"#{@diabla.image}\"]")
    expect(page).to have_content(@diabla.age)
    expect(page).to have_content(@diabla.sex)
    expect(page).to have_content(@diabla.current_shelter)
  end

end
