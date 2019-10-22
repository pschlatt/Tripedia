class YelpService

  def initialize(location)
    @location = location
  end

  def restaurants(interest)
    url = "/v3/businesses/search"
    lat = @location[:lat]
    long = @location[:lng]
    params = { term: interest, latitude: lat, longitude: long }
    get_json(url, params)
  end

  def connection
    Faraday.new("https://api.yelp.com") do |f|
      f.headers['Authorization'] = "Bearer" + " #{ENV['YELP_API_KEY']}"
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url, params)
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
end

# term=delis&latitude=39.7205825&longitude=-105.056658
