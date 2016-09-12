class NrelService

  def initialize
    @_conn = Faraday.new("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{location}&radius=6.0&fuel_type=ELEC,LPG&api_key=#{ENV['nrel_token']}")
  end

  def stations
    response = conn.get
    stations = JSON.parse(response.body, symbolize_name: true, object_class: OpenStruct)
    stations.map do |station|
      Station.new(station)
    end
  end

  private

  def conn
    @_conn
  end
end
