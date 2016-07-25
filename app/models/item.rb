class Item < ActiveRecord::Base
  belongs_to :company
  belongs_to :location

  def self.item_save
    companies = Company.all.map do |comp|
      self.format_and_save_items(comp)
    end
    self.save_location(companies)
  end

  def self.format_and_save_items(comp)
    companys_items = FHServices.new.items_hash(comp[:shortname])
    self.save_items_to_database(companys_items, comp)
    {items: companys_items, shortname: comp[:shortname]}
  end

  def self.save_items_to_database(companys_items, comp)
    companys_items.each do |company|
      item_details = company[1]
        item_details.each do |item|
          self.saving_iteration(item)
        end
        #TODO add regex to clean up entries
    end
  end

  def self.saving_iteration(item)
    unless Item.find_by(name: item_details[:name])
      new_item = Item.create(name: item[:name],
                           company_id: comp.id,
                           image: item[:image_cdn_url])
      specific_location = Location.find_by(name: item[:location])
      self.create_location_reference(item[:location], new_item, specific_location)
  end

  def self.save_location(items_information)
    items_information.each do |items_hash|
      if items_hash[:items][:items]
        items_hash = items_hash[:items][:items].first
        specific_company = Company.find_by(shortname: items_information.first[:shortname])
        specific_location = Location.find_by(name: items_hash[:location])
        self.create_location_reference(items_hash[:location], specific_company, specific_location)
      end
    end
  end

  def self.create_location_reference(location, specific_company, specific_location)
    if specific_location.nil?
      new_location = Location.create(name: location)
      specific_company.location_id = new_location.id
    else
      specific_company.location_id = specific_location.id
    end
    specific_company.save
  end

end
