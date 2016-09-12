class SearchController < ApplicationController
  def index

    location = params[:q]
    connection = Faraday.new("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{location}&api_key=#{ENV[nrel_key]}")
    connection.headers["Authorization"] = "token #{user.token}"
    JSON.parse(response.body, symbolize_name: true, object_class: OpenStruct)
  end
end
