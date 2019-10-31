require "rails_helper"

RSpec.describe "UserMailer", :type => :mailer do
  describe "notify" do
    it "renders the headers" do
      user = User.create(name: 'bob', email: 'bob@bigboys.com', password: 'pass')
      trip = user.trips.create!(origin: {'lat': 39.7392358, 'lng': -104.5674}, destination: {'lat': 34.97834, 'lng': -99.34674}, distance: "445 miles", duration: "5 hours")
      waypoints = [{"id":"LmfU13EiInyCTkFIN4pVLw",
         "alias":"colorado-fly-fishing-sedalia",
         "name":"Colorado Fly Fishing",
         "image_url":"https://s3-media2.fl.yelpcdn.com/bphoto/_fDC72ZR73jiA-Eaey_Jmw/o.jpg",
         "is_closed":false,
         "url":
          "https://www.yelp.com/biz/colorado-fly-fishing-sedalia?adjust_creative=pVrRdyk-0QZdpoY-HSxTFg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=pVrRdyk-0QZdpoY-HSxTFg",
         "review_count":4,
         "categories":[{"alias":"huntingfishingsupplies", "title":"Hunting & Fishing Supplies"}, {"alias":"fishing", "title":"Fishing"}],
         "rating":2.0}]

      mail = UserMailer.instructions(user, waypoints)

      stub_request(:post, "/api/v1/users/#{user.id}/trips/##{trip.id}")

      expect(mail.subject).to eq("Instructions")
      expect(mail.to).to eq(["bob@bigboys.com"])
      expect(mail.from).to eq(["noreply@company.com"])
    end
  end
end
