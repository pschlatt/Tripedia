require 'rails_helper'

RSpec.describe YelpService do
  describe 'instance methods' do
    describe '#interests(category)' do
      # it "returns a list of interests for location requested" do
      #   geo = GeocodeFacade.new('lakewood,co')
      #   location = geo.coordinates
      #   yelp = YelpService.new(location)
      #   category = "italian"
      #   response = yelp.interests(category)
      #
      #   expect(response.first).to have_key(:id)
      #   expect(response.first).to have_key(:alias)
      #   expect(response.first).to have_key(:name)
      #   expect(response.first).to have_key(:image_url)
      #   expect(response.first).to have_key(:url)
      #   expect(response.first).to have_key(:review_count)
      #   expect(response.first).to have_key(:categories)
      #   expect(response.first).to have_key(:rating)
      #   expect(response.first).to have_key(:price)
      #   expect(response.first).to have_key(:location)
      # end
    end
    # 
    # describe '#populate_pins(waypoints)' do
    #   it "returns information for each category requested as well as location" do
    #     waypoints = [{"location":{"lat":39.751774,"lng":-104.996809},"stopover":true},{"location":{"lat":39.773563,"lng":-105.039513},"stopover":true},{"location":{"lat":39.71698,"lng":-105.08001},"stopover":true}]
    #     yelp = YelpService.new(waypoints[0])
    #     binding.pry
    #   end
    # end
  end
end
