require 'rails_helper'

RSpec.describe 'Route_Creation', type: :request do
  it "can take origin and destination of a trip and return geocoded points" do
    user = User.create!(email: "yo@bach.com", password: "password")

    post "/api/v1/users/#{user.id}/trips?origin=denver,co&destination=taos,nm"
    expect(response).to be_successful

    trip = JSON.parse(response.body)
    expect(trip).to have_key("id")
    expect(trip).to have_key("origin")
    expect(trip).to have_key("destination")
    expect(trip).to have_key("user_id")
  end
end
