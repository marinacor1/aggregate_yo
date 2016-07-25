class Item < ActiveRecord::Base
  belongs_to :company
  belongs_to :location

  # def self.items_by_location(location)
  #   all_companies_in_area = Company.find_by_location(location)
  #     all_items = all_companies_in_area.map do |company|
  #       FHServices.new.items_hash(company)
  #     end
  #   grouped = self.organize_items(all_items) #TODO look at data for multiples
  #   cities_groups = grouped.group_by {|hash| hash[:location]}
  # end

  # def self.organize_items(all_items)
  #   binding.pry
  #   cleaned_all_items = all_items.first[:items]
  #   cleaned_all_items.map do |item|
  #     {name: item[:name], location: item[:location],
  #     image: item[:image_cdn_url]}
  #   end
  # end

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
      item_details = company[1] #hacky way to get access to details
        item_details.each do |item|
        # unless Item.find_by(name: item_details[:name])
          new_item = Item.create(name: item[:name],
                               company_id: comp.id,
                               image: item[:image_cdn_url])
          specific_location = Location.find_by(name: item[:location])
          self.create_location_reference(item[:location], new_item, specific_location)
        end
        #TODO add regex to clean up entries
    end
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
