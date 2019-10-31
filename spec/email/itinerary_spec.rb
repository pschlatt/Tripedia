# 
# require "rails_helper"
#
# RSpec.describe "UserMailer", :type => :mailer do
#   describe "notify" do
#
#     user = User.create(name: 'bob', email: 'bob@bigboys.com', password: 'pass')
#     trip = user.trips.create!(origin: {'lat': 39.7392358, 'lng': -104.5674}, destination: {'lat': 34.97834, 'lng': -99.34674}, distance: "445 miles", duration: "5 hours")
#     mail = UserMailer.instructions(user)
#
#     it "renders the headers" do
#       post "/api/v1/users/#{user.id}/trips/##{trip.id}"
#       expect(mail.subject).to eq("Instructions")
#       expect(mail.to).to eq(["bob@bigboys.com"])
#       expect(mail.from).to eq(["noreply@company.com"])
#     end
#       # it "sends full itinerary" do
#       #   assert_emails 1 do
#       #     mail.deliver_now
#       #   end
#       # end
#   end
# end
