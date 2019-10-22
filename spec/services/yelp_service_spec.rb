require 'rails_helper'

RSpec.describe YelpService do
  describe 'instance methods' do
    describe '#restaurants(location)' do
      it "returns a list of restaurants for location requested" do
        location = { 'lat': 39.7205825, 'lng': -105.056658 }
        interest = "restaurants"
        yelp = YelpService.new(location)
        response = yelp.restaurants(interest)

        expect(response).to be_a(Hash)
        expect(response).to have_key(:businesses)
      end
    end
  end
end
