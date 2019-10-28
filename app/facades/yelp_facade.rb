class YelpFacade

  def initialize(location, category)
    @location = location
    @category = category
  end

  def get_attractions
    Attraction.new(grabber.interests(@category))
  end

  def self.get_attractions_on_route(trip, categories)
    distance = trip[:distance].to_i
    str_or_coords = trip[:origin]
    str_dest_coords = trip[:destination]
    origin = eval(str_or_coords)
    destination = eval(str_dest_coords)
    origin_lat_and_lng = origin.values
    dest_lat_and_lng = destination.values
    interval_count = distance / 30
    x2 = dest_lat_and_lng[0]
    x1 = origin_lat_and_lng[0]
    y2 = dest_lat_and_lng[1]
    y1 = origin_lat_and_lng[1]
    lat_displacement = (x2 - x1)/interval_count
    lng_displacement = (y2 - y1)/interval_count
    yelp_radii = []
    interval_count.times do |interval|
      lat_and_lng = {}
      new_lat = x1 + lat_displacement
      new_lng = y1 + lng_displacement
      lat_and_lng[:lat] = new_lat
      lat_and_lng[:lng] = new_lng
      yelp_radii.push(lat_and_lng)
      x1 = new_lat
      y1 = new_lng
    end
    categories.map do |category|
      yelp_radii.flat_map do |location|
        YelpService.new(location).interests(category)
      end
    end
  end

  private

  def grabber
    @_grabber ||= YelpService.new(@location)
  end
end
