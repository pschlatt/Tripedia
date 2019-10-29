require 'rails_helper'

RSpec.describe DirectionsMatrixService do
  describe 'instance methods' do
    describe '#interests(category)' do
      it "returns a list of interests for location requested" do
        # distance = DirectionsMatrixService.new
        # response = distance.get_distance_and_duration(trip)
        response = 

        expect(response).to have_key(:destination_addresses)
        expect(response).to have_key(:origin_addresses)
        expect(response).to have_key(:rows)
        expect(response).to have_key(:status)
      end
    end
  end
end
