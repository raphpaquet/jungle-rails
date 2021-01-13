class SessionsController < ApplicationController

  def new
  end 

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
    #If the user exist AND the password entered is exact.
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
    cookies.delete :cart
    redirect_to '/login'
  end 
end 