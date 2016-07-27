class Company < ActiveRecord::Base
  has_many :items
  geocoded_by :location
  after_validation :geocode

  def self.company_save
    all_companies = FHServices.new.companies_hash[:companies]
    all_companies.each do |company|
      Company.find_or_create_by(shortname: company[:shortname], name: company[:name])
    end
    #how do I account for deleted companies?
  end

  def self.find_by_location(zip)
    Company.where(location: zip)
  end

  def self.in_record
    #compare cache collection of companies with all_companies
  end

end
