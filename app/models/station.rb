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
end
