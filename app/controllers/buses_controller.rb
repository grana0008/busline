class BusesController < ApplicationController
	
	def index
		@buses = Bus.search(params[:query]).page(params[:page]).per(10)
	end
end