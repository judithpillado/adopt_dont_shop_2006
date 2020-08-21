require "rails_helper"

RSpec.describe "Shelter Edit" do

  before(:each) do
    @alive = Shelter.create!(name: "ALIVE Rescue", address: "1214 W Monroe St", city: "Chicago", state: "IL", zip: 60607)
    @harmony = Shelter.create!(name: "Harmony House for Cats", address: "2914 N Elston Ave", city: "Chicago", state: "IL", zip: 60607)
    @paws = Shelter.create!(name: "PAWS Chicago", address: "1997 N Clybourn Ave", city: "Chicago", state: "IL", zip: 60618)
  end

  it "As a visitor, when I visit a shelter show page, I see a link to update the shelter 'Update Shelter'. When I click the link 'Update Shelter', then I am taken to a form to edit the shelter's information." do

    visit "/shelters/#{@harmony.id}"
    expect(page).to have_link("Update Shelter")

    click_link "Update Shelter"

    expect(current_path).to eq("/shelters/#{@harmony.id}/edit")

    expect(page).to have_content("Edit #{@harmony.name}")
    fill_in :name, with: "Harmony House for Cats"
    fill_in :address, with: "6379 N Paulina St"
    fill_in :city, with: "Chicago"
    fill_in :state, with: "IL"
    fill_in :zip, with: 60660

    click_button "Update Shelter"

    expect(current_path).to eq("/shelters/#{@harmony.id}")
    expect(page).to have_content(60660)
  end

end


# User Story 5, Shelter Update
#
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
