ActiveAdmin.register Line do
  index do                            
	column :id           
	column :name                 
	default_actions                   
  end

  form do |f|
  	f.inputs do 
  		f.input :name
  		f.input :busstops, as: :check_boxes
  	end
  	f.buttons
  end
end
