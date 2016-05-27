class Notifier < ApplicationMailer
  default from: 'aiste.ulozaite+didmena@gmail.com'
 
  def welcome_email
    mail(to: 'aiste.ulozaite+welcome@gmail.com', subject: 'welcome')
  end
end
