class LocationsController < ApplicationController
  def index

  end

  def show
    @location = Location.find(params['id']).name
    # params[location] will be passed into items_by_location and
    # only items within a certain location will be displayed
    city_group = Item.items_by_location(@location)
    @items = city_group[@location]
  end

end
