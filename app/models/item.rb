class Item
  attr_reader :service

  def initialize
    @service ||= FHServices.new
  end

  def self.items_by_location(location) #passed in through geofilter
    all_items = FHServices.new.items_hash(shortname)
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

end
