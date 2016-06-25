require 'rails_helper'

feature "user can visit a city through landing page drop down" do
  it "shows a dropdown menu" do
    city = Location.create(name: "Denver")

    visit root_path
    
    click_on "Where do you want to go?"
    select("Denver")
    click_button "Submit"

    expect(current_path).to eq location_path(city)

  end
end
