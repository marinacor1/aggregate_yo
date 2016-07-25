class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_updates

  def check_updates
    # current_time = Time.now
    # last_time = Item.last.updated_at
    # if last_time.nil? || (last_time - current_time) > -20
      update_companies_and_items
    # end
  end

  def update_companies_and_items
    Company.company_save
    Item.item_save
  end

end
