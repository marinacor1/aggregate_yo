class AddLocationIdToItems < ActiveRecord::Migration
  def change
    add_reference :items, :location, index: true, foreign_key: true
  end
end
