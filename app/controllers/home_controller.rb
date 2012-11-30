class HomeController < ApplicationController
	respond_to :html, :json, :js
	
	def index
		if params[:landmark]
			lines = Line.by_landmark_id(params[:landmark]).uniq
			@lines = lines.page(params[:page]).per(3)
			@busstops = Busstop.by_line_id(lines)
		else 	
			@lines = Line.find_all_by_id(params[:query])
			@lines = Kaminari.paginate_array(@lines).page(params[:page]).per(4)
			@busstops = Busstop.by_line_id(params[:query])
		end

		@json = @busstops.includes([:lines]).uniq.to_gmaps4rails do |busstop, marker|
			marker.json({ :id => busstop.id, :name => busstop.name, :line_ids => busstop.line_ids})
		end

		@response = {:json => @json, :lines => @lines}
		respond_with(@response)
	end
end