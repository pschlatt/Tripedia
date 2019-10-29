require 'rails_helper'

RSpec.describe GeocodeService do
  describe 'instance methods' do
    describe '#addressData(location)' do
      it 'returns the addressData for a location requested' do
        body = [
          address_components: 'denver,co',
          formatted_address: 'Denver, CO 80202',
          geometry: {lat: 34.567, lng: -103.785},
        ]
        response = stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver%20co&key=AIzaSyDB8SS8Xy8AGlUmcAOQhqurMugTBv31xns").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v0.17.0'
           }).
         to_return(status: 200, body: body, headers: {})

        expect(response.response.body).to be_a(Array)
        expect(response.response.body.first).to have_key(:address_components)
        expect(response.response.body.first).to have_key(:formatted_address)
        expect(response.response.body.first).to have_key(:geometry)

      end
    end
  end
end
