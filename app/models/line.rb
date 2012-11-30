class Line < ActiveRecord::Base
  attr_accessible :name, :stops_count, :busstop_ids
  has_many :buses
  has_and_belongs_to_many :busstops

  has_many :old_busstops, class_name: "Busstop"

  def self.by_landmark_id(landmark_ids)
    if landmark_ids.present?
      joins(busstops: [:landmarks]).where(busstops_landmarks: {landmark_id: landmark_ids})
    else
      scoped
    end
  end

end
