class Company < ActiveRecord::Base

  def self.company_save
    companies = FHServices.new.companies_hash
    all_companies = companies[:companies]
    all_companies.each do |comp|
      Company.first_or_create(name: comp[:name], shortname: comp[:shortname])
    end
  end


end
