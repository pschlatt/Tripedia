class Api::V1::KeyController < ApplicationController

  def show
    render json: (ENV['GOOGLE_API_KEY']).to_json
  end
end
