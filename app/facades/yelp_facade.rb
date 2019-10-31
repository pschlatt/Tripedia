class YelpFacade

  def initialize(location, category)
    @location = location
    @category = category
  end

  def get_attractions
    Attraction.new(grabber.interests(@category))
  end

  def self.get_attractions_on_route(trip, categories)
    # distance = trip[:distance].to_i
    # str_or_coords = trip[:origin]
    # str_dest_coords = trip[:destination]
    # origin = eval(str_or_coords)
    # destination = eval(str_dest_coords)
    # origin_lat_and_lng = origin.values
    # dest_lat_and_lng = destination.values
    # interval_count = distance / 30
    # x2 = dest_lat_and_lng[0]
    # x1 = origin_lat_and_lng[0]
    # y2 = dest_lat_and_lng[1]
    # y1 = origin_lat_and_lng[1]
    # lat_displacement = (x2 - x1)/interval_count
    # lng_displacement = (y2 - y1)/interval_count
    yelp_radii = [
      {latitude: 46.836546, longitude: -105.084418},
      {latitude: 47.121725, longitude: -104.138567},
      {latitude: 46.821361, longitude: -100.845078},
      {latitude: 46.924429, longitude: -99.700081},
      {latitude: 46.959530, longitude: -98.198487},
      {latitude: 46.846299, longitude: -96.667299},
      {latitude: 45.998496, longitude: -95.737501},
      {latitude: 45.938831, longitude: -95.586011},
      {latitude: 45.881000, longitude: -95.484776},
      {latitude: 45.835711, longitude: -95.314769},
      {latitude: 45.823752, longitude: -95.131101},
      {latitude: 45.761760, longitude: -95.022343},
      {latitude: 45.659239, longitude: -94.689017},
      {latitude: 45.619193, longitude: -94.545164},
      {latitude: 45.407724, longitude: -94.044795},
      {latitude: 45.309510, longitude: -93.810343},
      {latitude: 45.215590, longitude: -93.593123},
      {latitude: 45.075286, longitude: -93.327434},
      {latitude: 45.044083, longitude: -93.283776},
      {latitude: 44.991764, longitude: -93.285608}
    ]
    # yelp_radii.push(origin)
    # yelp_radii.push(destination)
    # interval_count.times do |interval|
    #   lat_and_lng = {}
    #   new_lat = x1 + lat_displacement
    #   new_lng = y1 + lng_displacement
    #   lat_and_lng[:lat] = new_lat
    #   lat_and_lng[:lng] = new_lng
    #   yelp_radii.push(lat_and_lng)
    #   x1 = new_lat
    #   y1 = new_lng
    # end
    categories.map do |category|
      yelp_radii.each_with_index.flat_map do |location, index|
        if (index % 2 == 0)
          YelpService.new(location).interests(category)
        end
      end.uniq
    end
  end

  private

  def grabber
    @_grabber ||= YelpService.new(@location)
  end
end
