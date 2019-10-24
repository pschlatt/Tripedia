class Api::V1::TripsController < ApplicationController

  def create
    facade = GeocodeFacade.new(trip_params[:origin])
    facade2 = GeocodeFacade.new(trip_params[:destination])
    user = User.find(trip_params[:user_id])
    origin = facade.coordinates
    destination = facade2.coordinates
    render json: Trip.create(origin: origin, destination: destination, user_id: user.id)
  end

  private

  def trip_params
    params.permit(:origin, :destination, :user_id)
  end
end
