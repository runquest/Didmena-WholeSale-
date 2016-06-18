class WelcomeController < ApplicationController
  
  def index
    @models = Model.all
  end

  def admin
    @users = User.all
    @companies = Company.all
    @orders = Order.all
  end

  def email_sent
    # @user = User.first
    @user = User.find(1)
    DidmenaMailer.first_email(@user).deliver_now
      # format.html { redirect_to @user, notice: 'User was successfully created.' }
    redirect_to user_path(@user)
  end

end