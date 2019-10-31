class Api::V1::TripsController < ApplicationController

  def create
    facade = DirectionsMatrixFacade.new(trip_params)
    @user = User.find(trip_params[:user_id])
    origin = origin_coords
    destination = destination_coords
    trip_data = facade.return_trip_details
    distance = trip_data[:rows][0][:elements][0][:distance][:text]
    duration = trip_data[:rows][0][:elements][0][:duration][:text]
    trip = Trip.create(origin: origin, destination: destination, distance: distance, duration: duration, user_id: @user.id)
    render json: {
      trip: trip,
      attractions: YelpFacade.get_attractions_on_route(trip, categories)
    }
  end

  def mail
    @user = User.find(email_params[:user_id])
    UserMailer.with(user: @user).instructions.deliver_now
  end

  private

  def categories
    [
    "active", "haunted", "museums", "spa",
    "bedbreakfast", "hotels", "resorts",
    "breweries", "divebars", "sports",
    "breakfast_brunch", "chinese", "american",
    "bodyshops", "servicestations", "reststops"
    ]
  end

  def origin_coords
    location = trip_params['origin']
    geo = GeocodeFacade.new(location)
    hash = {"lat": geo.coordinates[:lat], "lng": geo.coordinates[:lng]}
    JSON.generate(hash)
  end

  def destination_coords
    location = trip_params['destination']
    geo = GeocodeFacade.new(location)
    hash = {"lat": geo.coordinates[:lat], "lng": geo.coordinates[:lng]}
    JSON.generate(hash)
  end

  def trip_params
    params.permit(:origin, :destination, :user_id)
  end

  def email_params
    params.permit(:user_id, :trip_id)
  end
end
