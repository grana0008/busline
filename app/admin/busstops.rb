ActiveAdmin.register Busstop do
	index do                            
   		column :id           
   		column :name        
   		column :latitude           
   		column :longitude
    	column :gmaps            
   		default_actions                   
  	end
  	form :partial => "busstop"
end
