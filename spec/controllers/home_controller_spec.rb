require 'spec_helper'

describe HomeController do
	let(:lines) { Line.make! }
	let(:json) { Busstop.make! }
	let(:buses) { Bus.create! }
	let(:lanmark) { Lanmark.make! }

	before do
		#puts json.inspect
	end

	it "index lines" do
		get :index
		response.should be_success
		assign_to(:lines).should_not nil

	end
	it "index json" do
		get :index
		response.should be_success
		assign_to(:json).should_not nil
	end

	it "index buses" do
		response.should be_success
		assign_to(:buses).should_not nil
	end

	it "get params lines" do
		get :index, :id => lines.to_param
		response.should be_success
		assigns(lines).should_not nil
	end
	it "get params json" do
		get :index, :id => json.to_param
		response.should be_success
		assign_to(:json).should_not nil
	end
	it "get params buses" do
		get :index, :id => buses.to_param
		response.should be_success
		assign_to(:buses).should_not nil
	end

	it "search bus by line id" do
		Bus.bus_line_id(:lines).should_not nil
	end

	it "search by lanmark id" do
		Line.by_landmark_id(:lanmark).should_not nil
	end

	it "serach busstop by line id" do
		Busstop.by_line_id(:lines).should_not nil
	end

end