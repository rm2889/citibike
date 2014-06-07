class BikeStation
  attr_accessor :id, :station_name, :available_docks, :total_docks, :latitude, :longitude, :available_bikes

  def initialize(args)
    @id = args.fetch(:id)
    @station_name = args.fetch(:station_name)
    @available_docks = args.fetch(:available_docks)
    @total_docks = args.fetch(:total_docks)
    @latitude = args.fetch(:latitude)
    @longitude = args.fetch(:longitude)
    @available_bikes = args.fetch(:available_bikes)
  end

end

class City
  attr_accessor :city_name, :list_stations

  def initialize(args)
    @city_name = args.fetch(:city_name)
    @list_stations = args.fetch(:list_stations)
  end
end
