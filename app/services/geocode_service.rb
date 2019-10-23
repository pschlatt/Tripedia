class GeocodeService 

  def coordinates(location)
    url = "/maps/api/geocode/json"
    params = { address: location }
    get_json(url, params)[:results][0]
  end

  private

  def connection
    Faraday.new("https://maps.googleapis.com") do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY'] 
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url, params)
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
end