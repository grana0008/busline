class CreateBusstops < ActiveRecord::Migration
  def change
    create_table :busstops do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.references :line
      t.boolean :gmaps

      t.timestamps
    end
  end
end
