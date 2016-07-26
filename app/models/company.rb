class Company < ActiveRecord::Base
  has_many :items

  def self.company_save
    all_companies = FHServices.new.companies_hash[:companies]
    all_companies.each do |company|
      Company.find_or_create_by(name: company[:name], shortname: company[:shortname])
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
