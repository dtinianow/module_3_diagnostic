class SearchController < ApplicationController
  def index
    location = params[:q]
    token = ENV['nrel_token']
    connection = Faraday.new("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{location}&api_key=#{token}")
    # JSON.parse(response.body, symbolize_name: true, object_class: OpenStruct)
  end
end
