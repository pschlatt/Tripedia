require 'rails_helper'

RSpec.describe GeocodeService do
  describe 'instance methods' do
    describe '#addressData(location)' do
      it 'returns the addressData for a location requested' do
        geo = GeocodeService.new
        location = "denver co"
        response = geo.addressData(location)
<<<<<<< HEAD
        # expect(response).to be_a(Hash)
=======

        expect(response).to be_a(Hash)
        expect(response).to have_key(:address_components)
        expect(response).to have_key(:formatted_address)
        expect(response).to have_key(:geometry)
>>>>>>> 41355240e4664adbd322dc829d8da84640f662a0
      end
    end
  end
end
