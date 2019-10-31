require 'rails_helper'

RSpec.describe 'Trip_Creation', type: :request do
  it "can take origin and destination of a trip and return geocoded points" do
    # response =
    #   (user = User.create!(name: "miss buttersworth", email: "yo@bach.com", password: "password")
    #   trip_created = File.open("./fixtures/trip_creation.json")
    #   stub_request(:post, "/api/v1/users/#{user.id}/trips?origin=denver,co&destination=taos,nm").to_return(status:200, body:trip_created))
    # trip = JSON.parse(response.response.body)
    #
    # expect(trip).to have_key("trip")
    # expect(trip).to have_key("attractions")
    user = User.create!(name: "miss buttersworth", email: "yo@bach.com", password: "password")

    post "/api/v1/users/#{user.id}/trips?origin=seattle,wa&destination=minneapolis,mn"
    binding.pry
    trip_data = response.body

    File.open("sea_mnn_trip.json", "w") do |f|
      f.write(JSON.parse(trip_data))
    end
  end
end
