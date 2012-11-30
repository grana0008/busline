require 'spec_helper'

describe Busstop do
	it { should have_and_belong_to_many(:lines)}
	it { should have_and_belong_to_many(:landmarks)}
	let(:line) { Line.make! }
	let(:line2) { Line.make! }

	before do
		3.times { line.busstops << Busstop.make! }
		2.times { line2.busstops << Busstop.make! }
	end

	describe "Model Busstop" do
		it "Busstop search by_line_id" do
			busstops = Busstop.by_line_id(line.id)
			busstops.size.should == 3
		end
		it "Busstop search by_line_id all" do
			busstops = Busstop.by_line_id("")
			busstops.size.should == 5
		end
	end
end