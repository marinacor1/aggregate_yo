class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
    #TODO currently the relationship is not built because
    #there is no location_id for items
    #a possible solution is to check to see if location exists
    #if so add that as location id
    #else create a new location and then add that as location id
    
    # location_name = @location[:name]
    # city_group = Item.items_by_location(@location[:name])
    # @location_items = city_group[location_name]
  end

end
