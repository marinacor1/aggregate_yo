class Location < ActiveRecord::Base
  attr_accessor :name

  def to_param
    "#{name}"
  end
end
