require 'spec_helper'

describe BusesController do
	let(:buses) { Bus.make! }
	it "index bus" do
		get :index
		response.should be_success
		assign_to(:buses).should_not nil
	end

	it "get params bus" do
		get :index, :id => buses.to_param
		response.should be_success
		assign_to(:buses).should_not nil 
	end

	it "serch buses id" do
		Bus.search(:buses).should_not nil
	end

	it "" do
	end
end