class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :shortname
      t.float :latitude
      t.float :longitude
      t.string :location

      t.timestamps null: false
    end
  end
end
