class CreateBusstopsLines < ActiveRecord::Migration
  def up
  	create_table :busstops_lines, :id => false do |t|
        t.references :busstop
        t.references :line
    end
    add_index :busstops_lines, [:busstop_id, :line_id]
    add_index :busstops_lines, [:line_id, :busstop_id]
  end

  def down
  	drop_table :busstops_lines
  end
end
