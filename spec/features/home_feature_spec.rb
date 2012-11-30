#!/bin/env ruby
#encoding: utf-8
require 'spec_helper'

describe "user click"do

	it "user select and click search line" do
		visit "/"
		select('เลือกเส้นทาง', :from => 'query')
		click_button 'search'
	end

	it "user select and click search landmark" do
		visit "/"
		select('เลือก Landmark', :from => 'landmark')
		click_button 'search2'
	end
	
end