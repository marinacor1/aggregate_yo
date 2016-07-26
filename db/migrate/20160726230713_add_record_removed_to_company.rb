class AddRecordRemovedToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :removed, :boolean, :default => false
  end
end
