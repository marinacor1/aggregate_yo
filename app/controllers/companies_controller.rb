class CompaniesController < ApplicationController

  def index
    @companies = Company.company_save
  end

  def show
    @company = Company.find(params[:id])
  end
end
