require 'rails_helper'

RSpec.describe GeocodeService do
  describe 'instance methods' do
    describe '#addressData(location)' do
      it 'returns the addressData for a location requested' do
        geo = GeocodeService.new
        location = "denver co"
        response = geo.addressData(location)
        binding.pry
        expect(response).to be_a(Hash)
      end
    end
  end
end