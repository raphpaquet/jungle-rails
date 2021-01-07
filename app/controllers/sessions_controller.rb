class SessionsController < ApplicationController

  def new
  end 

  def create
    user = User.find_by_email(params[:email])
    #If the user exist AND the password entered is exact.
    if user && user.authenticate(params[:password])
      #Save the user id inside the browser cookie. This is how we keep the user logged in.
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user login doesn't work = back to login form 
      redirect_to '/login'
    end 
  end 

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end 

end 