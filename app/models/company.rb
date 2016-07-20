class Company < ActiveRecord::Base
  attr_reader :service

  def initialize
    @service ||= FHServices.new
  end

  def self.company_save
    all_services = service.companies_hash
    binding.pry
  end


end
