class WelcomeController < ApplicationController
  before_action :check_updates

  def check_updates
    current_time = Time.now
    last_time = Item.last.updated_at
    if last_time.nil? || (last_time - current_time) > 2400
      update_companies_and_items
    end
  end

  def update_companies_and_items
    Company.company_save
    Item.item_save
  end

  def show
    locations = Location.all
    @locations = locations.order(:name)
    #the list should be a filter and the list should be pulled from
    #a possible google maps api list
  end
end
