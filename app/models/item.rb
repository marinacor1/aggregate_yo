class Item
  attr_reader :service

  def initialize
    @service ||= FHServices.new
  end

  def self.items_by_location(location)
    all_companies = Company.find_by_location(location)
    all_companies.each do |shortname|
      all_items = FHServices.new.items_hash(shortname)
    end
    grouped = all_items[:items].map do |item|
      {name: item[:name], location: item[:location],
        image: item[:images]}
    end
    cities_groups = grouped.group_by {|hash| hash[:location]}
    # {"Miami, FL"=>[{:name=>"Marina's Bachata Dance Classes", :location=>"Miami, FL", :image=>[]}]}
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
      {items: FHServices.new.items_hash(comp[:shortname]), shortname: comp[:shortname]}
    end
    companies.each do |c|
      c[:items][:items].each do |item|
        comp = Company.find_by(shortname: c[:shortname])
        comp.location = item[:location]
        comp.save
      end
    end
  end

end
