ActiveAdmin.register Landmark do

	index do
		column :name
		column :latitude
		column :longitude
		column :gmaps
		default_actions 
	end
	form :partial => "landmark"
end
