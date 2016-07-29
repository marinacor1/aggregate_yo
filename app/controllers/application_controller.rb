class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :check_updates

  def check_updates
    update_companies_and_items if time_to_update?
  end

  def time_to_update?
    true
  end

  def update_companies_and_items
    Company.company_save
    Item.item_save
  end

end
