Gmaps.map.callback = ->
	for marker in Gmaps.map.markers
		marker.serviceObject.line_ids = marker.line_ids
		google.maps.event.addListener marker.serviceObject, "click", (marker) ->
			$.ajax
				url: "/"
				data:
					query: @line_ids
				dataType: 'script'
	google.maps.event.addListener Gmaps.map.serviceObject, "click", find_closest_marker

toggleBounce = (closest) ->
	for marker in Gmaps.map.markers
		if closest is marker
			marker.serviceObject.setAnimation google.maps.Animation.BOUNCE
			marker.infowindow.open Gmaps.map.serviceObject, marker.serviceObject
		else
			marker.serviceObject.setAnimation false
			marker.infowindow.close()

rad = (x) -> 
	return x*(Math.PI/180)
	
find_closest_marker = (event) ->
	lat = event.latLng.lat()
	lng = event.latLng.lng()
	R = 6371
	distances = []
	location = -1
	closest = -1
	for marker in Gmaps.map.markers		 
		mlat = marker.lat
		mlng = marker.lng
		dLat  = rad(mlat - lat)
		dLong = rad(mlng - lng)
		a = Math.sin(dLat/2) * Math.sin(dLat/2) +
		Math.cos(rad(lat)) * Math.cos(rad(lat)) * Math.sin(dLong/2) * Math.sin(dLong/2)
		c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
		d = R * c
		distances[i] = d
		if  closest is -1 or d < location	
			closest = marker
			location = d
			
	toggleBounce(closest)
