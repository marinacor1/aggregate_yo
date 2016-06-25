class WelcomeController < ApplicationController
  def show
    @locations = Location.all
  end
end
