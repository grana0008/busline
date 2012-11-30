require 'spec_helper'

describe Bus do
	it { should belong_to(:line) }
	let(:bus_1) { Bus.make! }
	let(:bus_2) { Bus.make! }
	let(:line) { bus_1.line }

	describe "Model and ultilities" do
		it "shloud search query" do
			buses = Bus.search(bus_1.busname)
			buses.should include bus_1
			buses.should_not include bus_2
		end

		it "should search query scoped" do
			buses = Bus.search(" ")
			buses.should include bus_1, bus_2
			buses.should_not be_empty
		end

		it "should have bus_line_id" do
			buses = Bus.bus_line_id(line.id)
			buses.should include bus_1
			buses.should_not include bus_2
		end

		it "should have bus_line_id scoped" do
			buses = Bus.bus_line_id(" ")
			buses.should include bus_1, bus_2
			buses.should_not be_empty
		end
	end
end