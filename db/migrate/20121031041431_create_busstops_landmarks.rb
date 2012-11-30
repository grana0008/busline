class CreateBusstopsLandmarks < ActiveRecord::Migration
  def up
  	create_table :busstops_landmarks, :id => false do |t|
        t.references :busstop
        t.references :landmark
    end
    add_index :busstops_landmarks, [:busstop_id, :landmark_id]
    add_index :busstops_landmarks, [:landmark_id, :busstop_id]
  end

  def down
  	drop_table :busstops_landmarks
  end
end
