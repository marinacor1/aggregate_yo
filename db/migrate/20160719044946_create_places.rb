class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :geocode
      t.string :slug

      t.timestamps null: false
    end
  end
end
