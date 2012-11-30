class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string   :price
      t.string  :color
      t.boolean :air_condition, default: false
      t.integer :line_id
      t.string  :startwork
      t.string  :busname

      t.timestamps
    end
  end
end
