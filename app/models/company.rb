class Company < ActiveRecord::Base

  def self.company_save
    companies = FHServices.new.companies_hash
    all_companies = companies[:companies]
    all_companies.each do |comp|
      Company.first_or_create(name: comp[:name], shortname: comp[:shortname])
    end
    #account for deleted companies
  end


  def self.company_save_location

  end

  def self.find_by_location(zip)
    Company.where(location: zip)
  end


end
