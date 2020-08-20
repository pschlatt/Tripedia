class UserMailer < ApplicationMailer
  default from: 'noreply@company.com'

  def instructions(user, waypoints)
    @user = user
    @trip = user.trips.first
    @waypoint = waypoints.first
    # binding.pry
    mail to: @user.email, subject: 'Instructions'
  end
end
