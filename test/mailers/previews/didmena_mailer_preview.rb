class DidmenaMailerPreview < ActionMailer::Preview

  def order_confirmation_sample
    DidmenaMailer.order_confirmation(User.first, Order.first)
  end
end