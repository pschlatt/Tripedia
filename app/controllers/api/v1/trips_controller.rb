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

  def radii
    stops = []
    distance = params[:distance].to_i
    while distance >= 25 do
      stops << distance -= 25
    end
    stops
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
