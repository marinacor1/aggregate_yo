class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    binding.pry
    @location = Location.find(params['id'])
    city_group = Item.items_by_location(@location[:name])
    @location_items = city_group[@location]
  end

end
