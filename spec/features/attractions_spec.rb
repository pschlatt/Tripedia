# require 'rails_helper'
#
# RSpec.describe 'Attractions', type: :request do
#   it "can take custom waypoints at 25 mile mark and return Yelp data" do
#     user = User.create!(email: "yo@bach.com", password: "password")
#     trip = Trip.create!(origin: {:lat=>39.7392358, :lng=>-104.990251}, destination: {:lat=>36.4072485, :lng=>-105.5730665}, distance: "287 mi", duration: "4 hours 42 mins", user_id: user.id)
#     waypoints = [{"location":{"lat":39.751774,"lng":-104.996809},"stopover":true},{"location":{"lat":39.773563,"lng":-105.039513},"stopover":true},{"location":{"lat":39.71698,"lng":-105.08001},"stopover":true}]
#     get "/api/v1/users/#{user.id}/trips/#{trip.id}?stops[]=#{waypoints}"
#     # GET /users?ids[]=1&ids;[]=2&ids;[]=3
#     expect(response).to be_successful
#     attractions = JSON.parse(response.body)
#
#   end
# end
