# require 'rails_helper'
#
# RSpec.describe 'Attractions_Creation', type: :request do
#   it "can take origin and destination of a trip and return geocoded points" do
#     user = User.create!(name: 'gbob', email: "yo@bach.com", password: "password")
#     trip = Trip.create!(origin: {:lat=>39.7392358, :lng=>-104.990251}, destination: {:lat=>36.4072485, :lng=>-105.5730665}, distance: "287 mi", duration: "4 hours 42 mins", user_id: user.id)
#
#     post ""
#     expect(response).to be_successful
#
#     attractions = JSON.parse(response.body, symbolize_names: true)
#     expect(attractions).to be_a(Array)
#     expect(attractions.length).to eq(3)
#   end
# end
