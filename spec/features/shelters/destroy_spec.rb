require "rails_helper"

RSpec.describe "Delete a Shelter" do

  before(:each) do
    @alive = Shelter.create!(name: "ALIVE Rescue", address: "1214 W Monroe St", city: "Chicago", state: "IL", zip: 60607)
    @harmony = Shelter.create!(name: "Harmony House for Cats", address: "2914 N Elston Ave", city: "Chicago", state: "IL", zip: 60607)
    @paws = Shelter.create!(name: "PAWS Chicago", address: "1997 N Clybourn Ave", city: "Chicago", state: "IL", zip: 60618)
  end

  it "As a visitor, when I visit a shelter's show page, I see a link to delete a shelter. When I click the link to delete it, the shelter no longer appears on the shelter index page." do

    visit "/shelters/#{@alive.id}"
    expect(page).to have_link("Delete Shelter")

    click_link "Delete Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(@alive.name)
  end

end 
