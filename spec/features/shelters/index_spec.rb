require "rails_helper"

RSpec.describe "Shelter Index Page" do

  before(:each) do
    @alive = Shelter.create!(name: "ALIVE Rescue", address: "1214 W Monroe St", city: "Chicago", state: "IL", zip: 60607)
    @harmony = Shelter.create!(name: "Harmony House for Cats", address: "2914 N Elston Ave", city: "Chicago", state: "IL", zip: 60607)
    @paws = Shelter.create!(name: "PAWS Chicago", address: "1997 N Clybourn Ave", city: "Chicago", state: "IL", zip: 60618)
  end

  it "As a visitor, I can see the name of each shelter in the system." do
    visit "/shelters"

    within(".shelters") do
      expect(page).to have_link(@alive.name)
      expect(page).to have_link(@harmony.name)
      expect(page).to have_link(@paws.name)
      expect(page).to_not have_content(@paws.address)
    end
  end

end
