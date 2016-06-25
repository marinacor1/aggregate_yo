class WelcomeController < ApplicationController
  def show
    @locations = Location.all #need to sort alphabetically
  end
end
