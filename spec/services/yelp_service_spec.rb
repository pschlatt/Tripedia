require 'rails_helper'

RSpec.describe YelpService do
  describe 'instance methods' do
    describe '#interests(category)' do
      it "returns a list of interests for location requested" do
        location = { 'lat': 39.7205825, 'lng': -105.056658 }
        yelp = YelpService.new(location)
        category = "restaurants"
        response = yelp.interests(category)

        expect(response.first).to have_key(:id)
        expect(response.first).to have_key(:alias)
        expect(response.first).to have_key(:name)
        expect(response.first).to have_key(:image_url)
        expect(response.first).to have_key(:url)
        expect(response.first).to have_key(:review_count)
        expect(response.first).to have_key(:categories)
        expect(response.first).to have_key(:rating)
        expect(response.first).to have_key(:price)
        expect(response.first).to have_key(:location)
      end
    end
  end
end
