require 'machinist/active_record'

Bus.blueprint do
	busname { "bus-#{sn}" }
	line { object.line || Line.make! }
end

Busstop.blueprint do
	name { "busstop_#{sn}"}
end
Landmark.blueprint do
	name { "landmark_#{sn}" }
end

Line.blueprint do
	name { "line_#{sn}" }
end