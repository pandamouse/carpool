# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
init_map = ->
  latlng = get_latlng()
  myOptions =
    center: latlng
    zoom: 8
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map $("#map_canvas")[0], myOptions
  geocoder = new google.maps.Geocoder
  window.map = map
  window.geocoder = geocoder
  show_on_map(latlng)

loadScript = ->
  script = document.createElement "script"
  script.type = "text/javascript"
  script.src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyBL5T3LzmZs3IdbTWO-zipwpxG6X3djNBU&sensor=false&callback=init_map"
  document.body.appendChild script

window.show_on_map = (latlng) ->
  map.setZoom 15
  map.setCenter latlng
  marker = new google.maps.Marker 
    animation: google.maps.Animation.DROP
    map: window.map
    position: latlng
 
window.get_latlng = (address_str="") ->
  if address_str.length>0
    geocoder.geocode 
      'address': address_str
      (results, status) ->
        if status == google.maps.GeocoderStatus.OK
          map.setZoom 15
          latlng = results[0].geometry.location
          map.setCenter latlng
          $('#address_latitude')[0].value = latlng.lat()
          $('#address_longitude')[0].value = latlng.lng()
          latlng
        else
          alert "Geocode wasn't successful for the following reason: #{status}"
  else if $('#address_latitude')[0].value.length > 0 &&
  $('#address_longitude')[0].value.length>0
    latlng = new google.maps.LatLng $('#address_latitude')[0].value, $('#address_longitude')[0].value
  else
    latlng = new google.maps.LatLng -34.397, 150.644
    

$ -> 
  $("#show_on_map").click (event) ->
    event.preventDefault()
    if $("#address_address_1")[0].value.length > 0 &&
      $("#address_suburb")[0].value.length > 0 &&
      $("#address_state")[0].value.length > 0 
        address_str = $("#address_address_1")[0].value + ", "
        address_str += $("#address_address_2")[0].value + ", " if $("#address_address_2")[0].value > 0
        address_str += $("#address_suburb")[0].value + ", "
        address_str += $("#address_state")[0].value + ", "
        address_str += $("#address_country")[0].value
        alert address_str
        latlng=get_latlng(address_str)
        show_on_map(latlng)


window.onload = loadScript
window.init_map = init_map
