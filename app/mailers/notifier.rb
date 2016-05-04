class Notifier < ApplicationMailer
  default from: 'aiste.ulozaite+didmena@gmail.com'
 
  def welcome_email(user)
    # binding.pry
    @user = user
    @url  = 'http://example.com/login'
    # binding.pry
    mail(to: 'aiste.ulozaite@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
