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
<<<<<<< HEAD
    # @user = User.first
=======
>>>>>>> refs/remotes/origin/master
    @user = User.find(1)
    DidmenaMailer.first_email(@user).deliver_now
    redirect_to user_path(@user)
  end

end