ActiveAdmin.register Bus do
	index do                            
   		column :id
   		column :busname           
   		column :price       
   		column :color          
   		column :air_condition
    	column :line_id
    	column :startwork            
   		default_actions                   
  	end
end
