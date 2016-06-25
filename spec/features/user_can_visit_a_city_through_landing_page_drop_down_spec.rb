require 'rails_helper'

feature "user can visit a city through landing page drop down" do
  it "shows a dropdown menu" do
    city = Location.create(name: "Denver")

    visit root_path

    select("Denver, Colorado")
    click_button "Submit"

    expect(current_path).to eq city_path(city)

  end
end
