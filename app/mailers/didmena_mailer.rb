class DidmenaMailer < ActionMailer::Base
	default from: "linas.uloza@gmail.com"

	def first_email(user)
		@user = user
		mail(to: @user.email, subject: 'First Email')
	end
end