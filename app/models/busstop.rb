class Busstop < ActiveRecord::Base
  has_and_belongs_to_many :lines
  has_and_belongs_to_many :landmarks
  attr_accessible :latitude, :name, :longitude, :gmaps, :line_ids, :landmark_ids
  acts_as_gmappable

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    name
  end

  def self.by_line_id(line_ids)
    if line_ids.present?
      joins(:lines).where(lines: {id: line_ids})
    else
      scoped
    end
  end

  def gmaps4rails_infowindow
      # add here whatever html content you desire, it will be displayed when users clicks on the marker
      "<h3>#{self.name}</h3>"
  end
  def gmaps4rails_sidebar
      "<span>#{self.name}</span>" #put whatever you want here
  end 
end
