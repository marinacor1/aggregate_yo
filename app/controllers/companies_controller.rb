class CompaniesController < ApplicationController

  def index
    @companies = Company.all
    @hash = Gmaps4rails.build_markers(@companies) do |company, marker|
      marker.lat company.latitude
      marker.lng company.longitude
    end
  end

  def show
    @company = Company.find(params[:id])
    @items = @company.items
  end
end
