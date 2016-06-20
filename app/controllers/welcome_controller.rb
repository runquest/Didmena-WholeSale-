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
    @user = User.first
    DidmenaMailer.first_email(@user).deliver_now
    redirect_to user_path(@user)
  end

end