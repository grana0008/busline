require 'spec_helper'

describe Landmark do
	it { should have_and_belong_to_many(:busstops)}
end