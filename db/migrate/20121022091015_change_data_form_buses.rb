class ChangeDataFormBuses < ActiveRecord::Migration
  def up
    change_table :buses do |t|
      t.change :price, :string
    end
  end

   def down
    change_table :buses do |t|
      t.change :price, :float
    end
  end
end
