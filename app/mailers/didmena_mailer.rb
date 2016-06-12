class DidmenaMailer < ActionMailer::Base
  default from: "aiste@aiste.ca"

  def first_email(user)
    @user = user
    mail(to: @user.email, subject: 'First Email')
  end
end