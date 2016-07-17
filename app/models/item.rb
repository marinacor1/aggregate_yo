class Item
  attr_reader :service

  def initialize
    @service ||= FHServices.new
  end

  def self.items_by_location #passed in through geofilter
    all_items = FHServices.new.items_hash
    all_items[:items].map do |item|
      {name: item[:name], location: item[:location],
        image: item[:images]}
    end

  end

end
