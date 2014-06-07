require 'json'
require 'net/http'
require 'uri'
# require 'geocoder'

require './models/bike_station'

class Controller
  attr_accessor :json_response, :city
  def initialize
    get_json_data
    create_bike_objects
  end

  def get_json_data
    uri = URI.parse("http://www.citibikenyc.com/stations/json")
    res = Net::HTTP.get_response(uri)
    body = res.body
    @json_response = JSON.parse(body)
  end

  def create_bike_objects
    city_stations = []
    json_hash = @json_response["stationBeanList"]
    json_hash.each do |bike|
      bike_args = create_bike_args(bike)
      bike_station = BikeStation.new(bike_args)
      city_stations << bike_station
    end
    @city = City.new({city_name: "New York", list_stations: city_stations})
    puts self.city.list_stations[4].station_name
  end

  def create_bike_args(bike_json)
    station_id = bike_json["id"]
    station_name = bike_json["stationName"]
    available_docks = bike_json["availableDocks"]
    total_docks = bike_json["totalDocks"]
    latitude = bike_json["latitude"]
    longitude = bike_json["longitude"]
    available_bikes = bike_json["available_bikes"]
    args = {id: station_id, station_name: station_name, available_docks: available_docks, total_docks: total_docks, latitude: latitude, longitude: longitude, available_bikes: available_bikes}
  end

end

controller = Controller.new


