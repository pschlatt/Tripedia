class Api::V1::TripsController < ApplicationController

  def create
    facade = DirectionsMatrixFacade.new(trip_params)
    user = User.find(trip_params[:user_id])
    trip_data = facade.return_trip_details
    origin = trip_data[:origin_addresses].join
    destination = trip_data[:destination_addresses].join
    distance = trip_data[:rows][0][:elements][0][:distance][:text]
    duration = trip_data[:rows][0][:elements][0][:duration][:text]
    render json: Trip.create(origin: origin, destination: destination, distance: distance, duration: duration, user_id: user.id)
  end

  private

  def trip_params
    params.permit(:origin, :destination, :user_id)
  end
end
