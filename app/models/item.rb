class Item
  attr_reader :service

  def initialize
    @service ||= FHServices.new
  end

  def self.items_by_location(location) #passed in through geofilter
    all_items = FHServices.new.items_hash
    grouped = all_items[:items].map do |item|
      {name: item[:name], location: item[:location],
        image: item[:images]}
    end
    cities = grouped.group_by {|hash| hash[:location]}
    
    # {"Miami, FL"=>[{:name=>"Marina's Bachata Dance Classes", :location=>"Miami, FL", :image=>[]}]}
  end

end
