class Company < ActiveRecord::Base
  has_many :items

  def self.company_save
    all_companies = FHServices.new.companies_hash[:companies]
    all_companies.each do |company|
      unless Company.find_by(shortname: company[:shortname])
        Company.create(name: company[:name], shortname: company[:shortname])
      end
    end
    #how do I account for deleted companies?
  end

  def self.find_by_location(zip)
    Company.where(location: zip)
  end

end
