class UsersController < ApplicationController

  before_filter :restrict_access, :except => [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      render 'users/dashboard'
      # redirect_to welcome_path, notice: "Welcome aboard, #{@user.fname}!"
    else
      render :new
    end
  end


  def dashboard
  end

  protected

  def user_params
    params.require(:user).permit(:email, :fname, :lname, :password, :password_confirmation, :role, :description)
  end
end