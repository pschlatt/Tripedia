class Api::V1::SessionsController < ApplicationController

  def create
    email = user_params[:email]
    password = user_params[:password]
    if (User.where(email: email, password: password).any?)
      render json: {email: email, logged_in: true}, status: 200
    else
      render json: {message: "Error, User/Password combination invalid."}, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

end
