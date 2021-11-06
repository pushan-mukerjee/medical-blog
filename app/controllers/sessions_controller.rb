class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) #if user was found and user.authenticate successfully authenticated password
      session[:user_id] = user.id #user remains signed in for all future requests
      flash[:notice] = "Logged in successfully"
      redirect_to user #go to user_path which is user's show page
    else
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end
  end

  def destroy
   session[:user_id] = nil
   flash[:notice] = "Logged out"
   redirect_to root_path  
  end

end
