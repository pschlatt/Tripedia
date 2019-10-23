class Api::V1::UsersController < ApplicationController

  def create
    email = user_params[:email]
    pass = user_params[:password]
    pass_conf = user_params[:password_confirmation]
    @user = User.new(email: email)
    @user.password = pass
    if (pass == pass_conf) && @user.save!
      render status: :created, json: {id: @user.id, email: @user.email, password: @user.password}
    elsif (pass != pass_conf)
      render json: {message: "Password and Password Confirmation need to be identical."}, status: 400
    else
      render json: {status: "error", message: "An unexpected error occured."}, status: 500
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
