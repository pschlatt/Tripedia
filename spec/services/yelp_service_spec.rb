require 'rails_helper'

RSpec.describe YelpService do
  describe 'instance methods' do
    describe '#interests(category)' do
      it "returns a list of interests for location requested" do
        location = { 'lat': 39.7205825, 'lng': -105.056658 }
        yelp = YelpService.new(location)
        category = "restaurants"
        response = yelp.interests(category)

        expect(response[0]).to have_key(:id)
        expect(response[0]).to have_key(:alias)
        expect(response[0]).to have_key(:name)
        expect(response[0]).to have_key(:image_url)
        expect(response[0]).to have_key(:url)
        expect(response[0]).to have_key(:review_count)
        expect(response[0]).to have_key(:categories)
        expect(response[0]).to have_key(:rating)
        expect(response[0]).to have_key(:location)
      end
    end
  end
end
