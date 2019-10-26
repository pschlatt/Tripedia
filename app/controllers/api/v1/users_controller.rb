class Api::V1::UsersController < ApplicationController

  def create
    email = user_params[:email]
    pass = user_params[:password]
    pass_conf = user_params[:password_confirmation]
    name = user_params[:name]
    @user = User.new(email: email)
    @user.password = pass
    @user.name = name
    if (User.where(email: email).any?)
      render json: {message: "Email already in use."}, status: 400
    elsif (pass == pass_conf) && @user.save!
      render status: :created, json: {id: @user.id, name: @user.name, email: @user.email, password: @user.password, account_created: true}
    elsif (pass != pass_conf)
      render json: {message: "Password and Password Confirmation need to be identical."}, status: 400
    else
      render json: {status: "error", message: "An unexpected error occured."}, status: 500
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end
