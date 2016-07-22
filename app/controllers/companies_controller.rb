class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @items = Item.items_by_company(@company[:shortname])
  end
end
