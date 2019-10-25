class YelpService

  def initialize(location)
    @location = location
  end

  def interests(category)
    url = "/v3/businesses/search"
    lat = @location[:lat]
    long = @location[:lng]
    params = { term: category, latitude: lat, longitude: long, radius: 4000 }
    get_json(url, params)[:businesses]
  end

private
  def connection
    @_connection ||= Faraday.new("https://api.yelp.com") do |f|
      f.headers['Authorization'] = "Bearer" + " #{ENV['YELP_API_KEY']}"
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url, params)
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
end
