class Company < ActiveRecord::Base
  def self.company_save
    all_companies = FHServices.new.companies_hash[:companies]
    all_companies.each do |company|
      Company.first_or_create(name: company[:name], shortname: company[:shortname])
    end
    #how do I account for deleted companies?
  end

  def self.find_by_location(zip)
    Company.where(location: zip)
  end

end
