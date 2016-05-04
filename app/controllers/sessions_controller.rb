class SessionsController < ApplicationController
  def new
    #render login page
  end

  #when login form is submitted
  def create
  	user = User.authenticate(params[:email], params[:password])
    #check whether user is an instructor or a student
    if is_instructor?(user)
      session[:user_id] = user.id
      redirect_to all_users_path
    elsif user
      session[:user_id] = user.id
      redirect_to user_path(user.id)
      # redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid Login"
      render :new
    end
  end

  #logout
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end