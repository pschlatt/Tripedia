class UserMailer < ApplicationMailer
  default from: "notifications@tripediatravel.com"

  def your_itinerary
    @user = params[:user]
    mail(to: @user.email, subject: "Your road trip itinerary")
  end
end
