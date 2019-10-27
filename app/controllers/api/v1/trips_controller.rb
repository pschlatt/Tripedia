class Api::V1::TripsController < ApplicationController

  def create
    facade = DirectionsMatrixFacade.new(trip_params)
    user = User.find(trip_params[:user_id])
    origin = origin_coords
    destination = destination_coords
    trip_data = facade.return_trip_details
    distance = trip_data[:rows][0][:elements][0][:distance][:text]
    duration = trip_data[:rows][0][:elements][0][:duration][:text]
    render json: Trip.create(origin: origin, destination: destination, distance: distance, duration: duration, user_id: user.id)
  end

  # def stops
  #   binding.pry
  # end

  def radii
    binding.pry
    trip = Trip.find(params[:id])
    str_or_coords = trip[:origin]
    str_dest_coords = trip[:destination]
    origin = eval(str_or_coords)
    destination = eval(str_dest_coords)
    origin_lat_and_lng = origin.values
    dest_lat_and_lng = destination.values
    interval_distance = distance / 30
    x2 = dest_lat_and_lng[0]
    x1 = origin_lat_and_lng[0]
    y2 = dest_lat_and_lng[1]
    y1 = origin_lat_and_lng[1]
    lat_displacement = (x2 - x1)/interval_distance
    lng_displacement = (y2 - y1)/interval_distance
    new_lat = x1 + lat_displacement
    new_lng = y1 + lng_displacement
    new_lat_and_lng << new_lat
    new_lat_and_lng << new_lng
    new_point_lat = new_lat_and_lng[0] + lat_displacement
    new_point_lng = new_lat_and_lng[1] + lng_displacement
  end



  private

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
