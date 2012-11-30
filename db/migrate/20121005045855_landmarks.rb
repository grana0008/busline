class Landmarks < ActiveRecord::Migration
  def change
  	create_table :landmarks do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
  	end
  end
end
