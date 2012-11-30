class Bus < ActiveRecord::Base 
  belongs_to :line 
  attr_accessible :price, :color, :air_condition, :line_id, :startwork, :busname

  def self.search(query) 
  	if query.present? 
  		where("busname LIKE ?", "%#{query}%") 
  	else 
  		scoped 
  	end 
  end
  
  def self.bus_line_id(line_id)
  	if line_id.present?
      where(line_id: line_id)
    else
      scoped
    end
  end
end 