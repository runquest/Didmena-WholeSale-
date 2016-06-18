class DidmenaMailer < ActionMailer::Base
  # default from: "aiste@aiste.ca"
  default from: "linas.uloza@gmail.com"

  def first_email(user)
    @user = user
    mail(to: @user.email, subject: 'First Email')
  end
end