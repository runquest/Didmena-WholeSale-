class WelcomeController < ApplicationController
  
  def index
    @models = Model.all
  end

end