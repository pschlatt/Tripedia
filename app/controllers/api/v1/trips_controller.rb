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
    midpoint = Geocoder::Calculations.geographic_center([origin_lat_and_lng, dest_lat_and_lng])
    interval_count = 
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
