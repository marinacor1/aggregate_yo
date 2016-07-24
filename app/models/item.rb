class Item < ActiveRecord::Base

  def self.items_by_location(location)
    all_companies_in_area = Company.find_by_location(location)
      all_items = all_companies_in_area.map do |company|
        FHServices.new.items_hash(company)
      end
    grouped = self.organize_items(all_items)
    cities_groups = grouped.group_by {|hash| hash[:location]}
  end

  def self.organize_items(all_items)
    cleaned_all_items = all_items.first[:items]
    cleaned_all_items.map do |item|
      {name: item[:name], location: item[:location],
      image: item[:image_cdn_url]}
    end
  end

  def self.items_by_company(shortname)
    all_items = FHServices.new.items_hash(shortname)
    grouped = all_items[:items].map do |item|
      {name: item[:name], location: item[:location],
        image: item[:image_cdn_url]}
    end
  end

  def self.item_save
    all_companies = Company.all
    companies = all_companies.map do |comp|
      companys_items = FHServices.new.items_hash(comp[:shortname])
      self.save_items_to_database(companys_items, comp)
      {items: companys_items, shortname: comp[:shortname]}
    end
    self.save_location(companies)
  end

  def self.save_items_to_database(companys_items, comp)
    companys_items.each do |item|
      item_details = item[1][0] #hacky way to get access to details
      if item_details.class == Hash
        Item.first_or_create(name: item_details[:name],
                             location: item_details[:location],
                             company_id: comp.id,
                             image: item_details[:image_cdn_url])
        Location.first_or_create(name: item_details[:location])
        #TODO add regex to clean up entries
      end
    end
  end

  def self.save_location(items_information)
    items_information.each do |items_hash|
      if items_hash[:items][:items]
        items_hash = items_hash[:items][:items].first
        specific_company = Company.find_by(shortname: items_information.first[:shortname])
        specific_company.location = items_hash[:location]
        specific_company.save
      end
    end
  end

end
