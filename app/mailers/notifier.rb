class Notifier < ApplicationMailer
  default from: 'aiste.ulozaite+didmena@gmail.com'
 
  def welcome_email()
    mail(to: 'aiste@aiste.ca', subject: 'Welcome to My Awesome Site')
  end
end
