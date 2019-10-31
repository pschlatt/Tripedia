class UserMailer < ApplicationMailer
  default from: 'noreply@company.com'

  def instructions(user)
    @name = user.name

    mail to: user.email, subject: 'Instructions'
  end
end
