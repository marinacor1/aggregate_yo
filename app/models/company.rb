class Company < ActiveRecord::Base
  has_many :items

  def self.company_save
    all_companies = FHServices.new.companies_hash[:companies]
    all_companies.each do |company|
      binding.pry
      Company.first_or_create(name: company[:name], shortname: company[:shortname])
      #TODO this is currently not saving all companies
    end
    #how do I account for deleted companies?
  end

  def self.find_by_location(zip)
    Company.where(location: zip)
  end

end
