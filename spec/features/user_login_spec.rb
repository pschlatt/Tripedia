require 'rails_helper'

RSpec.describe "User_Creation", type: :request do

  it "Can make a unsuccessful request" do
    get "/api/v1/users?"
    user = JSON.parse(response.body)
    expect(user).to have_key("message")
    expect(user.values).to eq(["Error, User/Password combination invalid."])
    expect(response.status).to eq(400)
  end

  it "Can make a Unsuccessful request - Unmatched Passwords" do
    get "/api/v1/users?email=paul@gmail.com&password=122&password_confirmation=123"
    user = JSON.parse(response.body)
    expect(user).to have_key("message")
    expect(user.values).to eq(["Error, User/Password combination invalid."])
    expect(response.status).to eq(400)
  end

  it "Can make a Unsuccessful request - Email Already Used" do
    User.create(email: "paul@gmail.com", password: "apassward")
    get "/api/v1/users?email=paul@gmail.com&password=apassward"
    user = JSON.parse(response.body)
    expect(user).to have_key("email")
    expect(user).to have_key("logged_in")
    expect(user.values).to eq(["paul@gmail.com", true])
    expect(response.status).to eq(200)
  end

end
