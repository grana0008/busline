#!/bin/env ruby
#encoding: utf-8
require 'spec_helper'

describe "event buses" do

	it "user select and click search bus" do
		visit "/buses"
		select('เลือกรถเมล์', :from => 'query')
		click_button 'search'
	end
	
end