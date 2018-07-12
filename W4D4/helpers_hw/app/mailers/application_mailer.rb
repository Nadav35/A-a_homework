class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url = 'everybody@appacademy.io'
    mail(to: user.username, subject: 'Welcome buddy')
  end
end
