require 'rails_helper'

RSpec.describe YelpService do
  describe 'instance methods' do
    describe '#interests(category)' do
      it "returns a list of interests for location requested" do
        body = [
          id: 1,
          alias: 'my house',
          name: 'gto',
          image_url: 'https://i.pinimg.com/474x/37/ca/28/37ca2891f0dce67e75f39dd146ca7052--hotrods-cool-cars.jpg',
          url: 'https://en.wikipedia.org/wiki/Pontiac_GTO',
          review_count: 117,
          categories: 'furious, fast',
          rating: 5,
          location: 'my house'
        ]

        response = stub_request(:get, "https://api.yelp.com/v3/businesses/search?latitude=39.7205825&longitude=-105.056658&radius=4000&term=restaurants").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Authorization'=>'Bearer OWfLzzBrDfViAT4iIjyfI9P5s-09JoRPkjmActiCzsi_s-7xuWgOvUdr-yhYN-UQV-MmXzMNN8zldS2GQCNtTwWSgvaPFzDyOfBxTDe7Tgnk7noQCZuhTn2iE3m3XXYx',
       	  'User-Agent'=>'Faraday v0.17.0'
           }).to_return(status: 200, body: body, headers: {})

        expect(response.response.body.first).to have_key(:id)
        expect(response.response.body.first).to have_key(:alias)
        expect(response.response.body.first).to have_key(:name)
        expect(response.response.body.first).to have_key(:image_url)
        expect(response.response.body.first).to have_key(:url)
        expect(response.response.body.first).to have_key(:review_count)
        expect(response.response.body.first).to have_key(:categories)
        expect(response.response.body.first).to have_key(:rating)
        expect(response.response.body.first).to have_key(:location)

      end
    end
  end
end
