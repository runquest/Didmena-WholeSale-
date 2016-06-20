class DidmenaMailer < ActionMailer::Base
  default from: "aiste.ulozaite@gmail.com"

  # def first_email(user)
  #   @user = user
  #   mail(to: 'aiste@aiste.ca', subject: 'First Email')
  # end

  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Order confirmation.')
  end

end