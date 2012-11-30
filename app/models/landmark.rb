class Landmark < ActiveRecord::Base
  attr_accessible :name, :latitude, :longitude, :gmaps, :busstop_ids
  has_and_belongs_to_many :busstops
  acts_as_gmappable

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
      name
  end
end
