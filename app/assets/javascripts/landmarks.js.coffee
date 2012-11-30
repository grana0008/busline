markersArray = []

Gmaps.map_select.callback = ->
  google.maps.event.addListener(Gmaps.map_select.serviceObject, 'click', (event) ->
    clearOverlays()
    placeMarker(event.latLng)
    updateFormLocation(event.latLng))
  

  updateFormLocation = (latLng) ->
    $('#landmark_latitude').val(latLng.lat())
    $('#landmark_longitude').val(latLng.lng())
    $('#location_attributes_gmaps_zoom').val(Gmaps.map_select.serviceObject.getZoom())

  placeMarker = (latLng) ->
    marker = new google.maps.Marker(
      position: latLng
      map: Gmaps.map_select.serviceObject
      draggable: true)

    markersArray.push(marker)

    infowindow = new google.maps.InfoWindow()

    infowindow.open(Gmaps.map_select.serviceObject, marker)

    google.maps.event.addListener(marker, 'dragend', ->
      updateFormLocation(@.getPosition()))

  clearOverlays = ->
    if markersArray 
      markersArray[marker].setMap(null) for marker in markersArray
    markersArray.length = 0