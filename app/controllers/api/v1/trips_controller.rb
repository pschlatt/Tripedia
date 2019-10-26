class Api::V1::TripsController < ApplicationController

  def create
    facade = DirectionsMatrixFacade.new(trip_params)
    user = User.find(trip_params[:user_id])
    origin = facade.coordinates
    destination = facade2.coordinates
    render json: Trip.create(origin: origin, destination: destination, distance: distance, duration: duration, user_id: user.id)
  end

  private

  def trip_params
    params.permit(:origin, :destination, :user_id)
  end
end
