require 'json'
require 'net/http'
require 'uri'
require 'geocoder'


# response = Net::HTTP.get_response("http://api.citybik.es", "/citi-bike-nyc.json")
# p response.body

DIRECTIONS_API_KEY = "AIzaSyBB2uDlsQn6B_b-ru0vaMtnYdg1QVPYwmg"

uri = URI.parse("http://www.citibikenyc.com/stations/json")
res = Net::HTTP.get_response(uri)
puts res.body



location = Geocoder.search('48 Wall Street, New York, NY')
p location[0].latitude
p location[0].longitude

# response = Net::HTTP.post_form(uri, {"search" => "Berlin"})
# p response.methods
# p response.body

=begin

create a bike class, which would have all this relevant info, and a city class, which
would have a list of bike stations

=end
