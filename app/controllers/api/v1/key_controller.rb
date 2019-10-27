class Api::V1::KeyController < ApplicationController

  def show
    render json: ("AIzaSyDB8SS8Xy8AGlUmcAOQhqurMugTBv31xns").to_json
  end
end
