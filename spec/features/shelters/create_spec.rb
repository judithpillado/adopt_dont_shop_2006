require "rails_helper"

RSpec.describe "Shelter Creation" do

  it "As a visitor, I see a link to create a new shelter. When I click on 'New Shelter', I'm taken to 'shelters/new' where I can fill out the form to create a new shelter with the necessary information." do
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
