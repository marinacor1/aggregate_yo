class Item
  attr_reader :service

  def initialize
    @service = FHServices.new
  end

  def items_by_location(zipcode) #passed in through geofilter
    binding.pry
  end

end
