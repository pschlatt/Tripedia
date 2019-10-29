require 'rails_helper'

RSpec.describe DirectionsMatrixService do
  describe 'instance methods' do
    describe '#interests(category)' do
      it "returns a list of interests for location requested" do
        body = [
          destination_addresses: '123 Anywhere St.',
          origin_addresses: '456 NotHere St.',
          rows: 2,
          status: 200
        ]
        response = stub_request(:get, "https://maps.googleapis.com/maps/api/distancematrix/json?destinations=taos,nm&key=AIzaSyDB8SS8Xy8AGlUmcAOQhqurMugTBv31xns&origins=denver,co&units=imperial").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v0.17.0'
           }).
         to_return(status: 200, body: body, headers: {})

        expect(response.response.body.first).to have_key(:destination_addresses)
        expect(response.response.body.first).to have_key(:origin_addresses)
        expect(response.response.body.first).to have_key(:rows)
        expect(response.response.body.first).to have_key(:status)
      end
    end
  end
end
