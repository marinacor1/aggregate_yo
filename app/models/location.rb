class Location < ActiveRecord::Base
  attr_accessor :name

  validates_presence_of :slug
  
  def slug
    name.downcase.gsub(" ", "-")
  end

  def to_param
    "#{name}"
  end
end
