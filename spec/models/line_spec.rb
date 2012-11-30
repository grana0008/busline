require 'spec_helper'

describe Line do
	it { should have_and_belong_to_many(:busstops)}
	it { should have_many(:buses)}
	describe "Model Line" do
		let!(:line) { Line.make! }
		let!(:busstops) { line.busstops << Busstop.make! }
		let!(:busstop) { busstops.first }
		let!(:landmarks) { busstop.landmarks << Landmark.make! }
		let!(:landmark) { landmarks.first }

		it "Line search by_landmark_id" do
			lines = Line.by_landmark_id(landmark.id)
			lines.should include line
		end
	end

end