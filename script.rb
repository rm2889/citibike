require 'json'
require 'net/http'
require 'uri'
require 'geocoder'


# response = Net::HTTP.get_response("http://api.citybik.es", "/citi-bike-nyc.json")
# p response.body



uri = URI.parse("http://www.citibikenyc.com/stations/json")
res = Net::HTTP.get_response(uri)
# puts res.body



location = Geocoder.search('48 Wall Street, New York, NY')
p location[0].latitude
p location[0].longitude

my_address = Geocoder.search('7 Carmine Street, New York, NY')

dbc_array_coords = [location[0].latitude, location[0].longitude]
home_array_coords = [my_address[0].latitude, my_address[0].longitude]

puts Geocoder::Calculations.distance_between(dbc_array_coords, home_array_coords)
# puts Geocoder::Calculations.distance_between(location, my_address)



# response = Net::HTTP.post_form(uri, {"search" => "Berlin"})
# p response.methods
# p response.body

# Next steps:
=begin

Need to precalculate and sort distance between starting location and all possible citibike
locations using the gem, find the top 5, and send those top 5 citibike stops to the google
distance matrix api to get the exact distance

https://developers.google.com/maps/documentation/distancematrix/#DistanceMatrixRequests

sort by distance (or walking duration), find the closest one, select that as the departure
citibike station.

Do the same thing with ending destination and all the citibike stops! Once that's done,
call the directions api with your 4 points on the coordinate map

=end
