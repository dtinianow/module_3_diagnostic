class Station < OpenStruct

  def self.service
    NrelService.new
  end

  def self.nearest_stations
    stations = service.get_stations
    stations.map do |station|
      Station.new(station)
    end
  end

## This method is used for logic in the controller and should be deleted once services are working
  def self.generate_stations(stations)
    stations.map do |station|
      Station.new(station)
    end
    stations
  end
end
