class Item < ActiveRecord::Base

  def self.items_by_location(location)
    all_companies = Company.find_by_location(location)
      all_companies.each do |shortname|
        all_items = FHServices.new.items_hash(shortname)
      end
    grouped = organize_items(all_items)
    cities_groups = grouped.group_by {|hash| hash[:location]}
  end

  def organize_items(all_items)
    all_items[:items].map do |item|
      {name: item[:name], location: item[:location],
      image: item[:images]}
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
      c_items = FHServices.new.items_hash(comp[:shortname])
      save_items_to_database(c_items)
      {items: c_items, shortname: comp[:shortname]}
    end
    save_location(companies)
  end

  def save_item_to_database(c_items)
    c_items.each do |item|
      Item.first_or_create(name: item[:name], location: item[:location], company_id: comp.id)
    end
  end

  def save_location(companies)
    companies.each do |c|
      c[:items][:items].each do |item|
        comp = Company.find_by(shortname: c[:shortname])
        comp.location = item[:location]
        comp.save
      end
    end
  end

end
