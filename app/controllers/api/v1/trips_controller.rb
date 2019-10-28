class Api::V1::TripsController < ApplicationController

  def create
    facade = DirectionsMatrixFacade.new(trip_params)
    user = User.find(trip_params[:user_id])
    origin = origin_coords
    destination = destination_coords
    trip_data = facade.return_trip_details
    distance = trip_data[:rows][0][:elements][0][:distance][:text]
    duration = trip_data[:rows][0][:elements][0][:duration][:text]
    trip = Trip.create(origin: origin, destination: destination, distance: distance, duration: duration, user_id: user.id)
    render json: {
      trip: trip,
      attractions: YelpFacade.get_attractions_on_route(trip, categories)
    }
  end


  def stops
    distance = params[:distance].to_i
    interval_count = ( distance / 25 ).to_i
    trip = Trip.find(params[:id])
    str_or_coords = trip[:origin]
    str_dest_coords = trip[:destination]
    origin = eval(str_or_coords)
    destination = eval(str_dest_coords)
    origin_lat_and_lng = origin.values
    dest_lat_and_lng = destination.values
    x1 = origin_lat_and_lng[0]
    x2 = dest_lat_and_lng[0]
    y1 = origin_lat_and_lng[1]
    y2 = dest_lat_and_lng[1]
    # midpoint = Geocoder::Calculations.geographic_center([origin_lat_and_lng, dest_lat_and_lng])
  end



  private

  def categories
    [
    "active", "galleries", "haunted",
    "museums", "spa", "nightlife",
    "bedbreakfast", "hotels", "campgrounds",
    "resorts", "hostels", "rvparks",
    "breweries", "divebars", "pub",
    "wine", "champagne_bars", "sports",
    "breakfast_brunch", "chinese", "hotdogs",
    "american", "gastropub", "gluten_free",
    "bodyshops", "evchargingstations", "servicestations",
    "reststops", "petservices", "pharmacy"
    ]
  end

  def origin_coords
    location = trip_params['origin']
    geo = GeocodeFacade.new(location)
    geo.coordinates
  end

  def destination_coords
    location = trip_params['destination']
    geo = GeocodeFacade.new(location)
    geo.coordinates
  end

  def trip_params
    params.permit(:origin, :destination, :user_id)
  end
end
