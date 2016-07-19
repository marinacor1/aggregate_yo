class Location < ActiveRecord::Base

  def slug
    name.downcase.gsub(" ", "-")
  end

  def to_param
    "#{name}"
  end
end
