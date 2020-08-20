require "rails_helper"

RSpec.describe "As a visitor" do
  it "I see a link to create a new shelter. When I click on 'New Shelter', I'm taken to 'shelters/new' where I can fill out the form to create a new shelter with the necessary information." do
    visit "/shelters"
    expect(page).to have_link("New Shelter")
    click_link "New Shelter"
    expect(current_path).to eq("/shelters/new")

    expect(page).to have_content("Create a New Shelter")
    fill_in :name, with: "Felines & Canines"
    fill_in :address, with: "6379 N Paulina St"
    fill_in :city, with: "Chicago"
    fill_in :state, with: "IL"
    fill_in :zip, with: 60660

    click_button "Create Shelter"
    expect(current_path).to eq("/shelters")
    expect(page).to have_content("Felines & Canines")
  end
end
# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
