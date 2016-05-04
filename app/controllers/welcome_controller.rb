class WelcomeController < ApplicationController
  
  def index
    @models = Model.all
  end

  def admin
    @users = User.all
    @companies = Company.all
    @orders = Order.all
  end

end