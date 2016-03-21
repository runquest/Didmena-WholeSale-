class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to collections_path
    else
      flash.now[:alert] = "Log in failed...Try again."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Adios!"
  end

end