class Notifier < ActionMailer::Base
  default from: 'aiste.ulozaite@gmail.com'
 
  def welcome_email
    mail(to: 'aiste.ulozaite@gmail.com', subject: 'welcome')
  end
end
