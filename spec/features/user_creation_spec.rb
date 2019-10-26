require 'rails_helper'

RSpec.describe "User_Creation", type: :request do

  it "Can make a successful request" do
    post "/api/v1/users?name=paul&email=paul@gmail.com&password=123&password_confirmation=123"
    expect(response).to be_successful
    user = JSON.parse(response.body)
    expect(user).to have_key("id")
    expect(user).to have_key("email")
    expect(user).to have_key("password")
    expect(user).to have_key("account_created")
    expect(response).to have_http_status(:success)
  end

  it "Can make a Unsuccessful request - Unmatched Passwords" do
    post "/api/v1/users?email=paul@gmail.com&password=122&password_confirmation=123"
    user = JSON.parse(response.body)
    expect(user).to have_key("message")
    expect(response.status).to eq(400)
  end

  it "Can make a Unsuccessful request - Email Already Used" do
    User.create(name: "paul", email: "paul@gmail.com", password: "apassward")
    post "/api/v1/users?email=paul@gmail.com&password=123&password_confirmation=123"
    user = JSON.parse(response.body)
    expect(user).to have_key("message")
    expect(response.status).to eq(400)
  end

end
