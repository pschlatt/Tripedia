require 'rails_helper'

RSpec.describe GeocodeService do
  describe 'instance methods' do
    describe '#coordinates(location)' do
      it 'returns the coordinates for a location requested' do
        geo = GeocodeService.new
        location = "denver co"
        response = geo.coordinates(location)
        binding.pry
        expect(response).to be_a(Hash)
      end
    end
  end
end