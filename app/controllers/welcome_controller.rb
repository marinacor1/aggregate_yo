class WelcomeController < ApplicationController

  def show
    locations = Location.all
    @locations = locations.order(:name)
  end
end
