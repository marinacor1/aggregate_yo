class LocationsController < ApplicationController
  def index

  end

  def show
    # params[location] will be passed into items_by_location and 
    # only items within a certain location will be displayed
    @items = Item.items_by_location
  end

end
