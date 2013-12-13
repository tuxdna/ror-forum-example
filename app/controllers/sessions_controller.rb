class SessionsController < ApplicationController
  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]

  def login
    
  end

  def logout
    session[:user_id] = nil
    redirect_to(:action => 'login')
  end

  def home
  end

  def profile
    user_id = session[:user_id]
    @user = User.find(user_id)
  end

  def setting
  end

  def login_attempt
    authorized_user = User.authenticate(params[:userid],params[:password])

    if authorized_user
      puts "Login successfull!"
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.name}"
      session[:user_id] = authorized_user.id

      redirect_to(:action => 'home')
    else
      puts "Login FAILED!"
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"	
    end
  end
end
