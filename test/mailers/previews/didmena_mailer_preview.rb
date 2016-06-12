# Preview all emails at http://localhost:3000/rails/mailers/didmena_mailer
class DidmenaMailerPreview < ActionMailer::Preview
  def first_mail_preview
    DidmenaMailer.first_email(User.first)
  end
end