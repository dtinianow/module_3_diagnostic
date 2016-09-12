class SearchController < ApplicationController
  def index
    location = params[:q]
    connection = Faraday.new("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{location}&radius=6.0&fuel_type=ELEC,LPG&api_key=#{ENV['nrel_token']}")
    response = connection.get
    @locations = JSON.parse(response.body, symbolize_name: true, object_class: OpenStruct)
    # require "pry"; binding.pry
  end
end
