class WelcomeController < ApplicationController
  def show
    locations = Location.all
    @locations = locations.order(:name)
    #the list should be a filter and the list should be pulled from
    #a possible google maps api list 
  end
end
