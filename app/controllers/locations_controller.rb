class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
    location_name = @location[:name]
    city_group = Item.items_by_location(@location[:name])
    @location_items = city_group[location_name]
  end

end
