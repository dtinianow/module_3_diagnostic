class NrelService

  def initialize
    @_conn = Faraday.new("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{location}&radius=6.0&fuel_type=ELEC,LPG&api_key=#{ENV['nrel_token']}")
  end

  def get_stations
    response = conn.get
    JSON.parse(response.body, symbolize_name: true, object_class: OpenStruct)
  end

  private

  def conn
    @_conn
  end
end
