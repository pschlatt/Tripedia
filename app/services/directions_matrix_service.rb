class DirectionsMatrixService

  def initialize(trip)
    @trip = trip
  end

  def get_distance_and_duration
    url = "/maps/api/distancematrix/json"
    origin = @trip[:origin]
    destination = @trip[:destination]
    params = { units: 'imperial', origins: origin, destinations: destination }
    get_json(url, params)
  end


  private

  def connection
    @_connection ||= Faraday.new("https://maps.googleapis.com") do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url, params)
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
end
