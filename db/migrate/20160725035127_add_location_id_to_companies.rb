class AddLocationIdToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :location, index: true, foreign_key: true
  end
end
