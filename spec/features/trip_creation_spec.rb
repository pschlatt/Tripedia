require 'rails_helper'

RSpec.describe 'Trip_Creation', type: :request do
  it "can take origin and destination of a trip and return geocoded points" do

    response = stub_trip_creation_call
    trip = JSON.parse(response.response.body)

    expect(trip).to have_key("trip")
    expect(trip).to have_key("attractions")
  end
end
