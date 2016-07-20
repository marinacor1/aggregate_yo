class Company < ActiveRecord::Base
  attr_reader :service

  def initialize
    @service ||= FHServices.new
  end

  def self.company_save
    
  end


end
