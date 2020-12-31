class SessionsController < ApplicationController
  def new
  end

  def create
    session[:username] = params[:username]
    if session[:username] == nil || session[:username] == ""
      redirect_to '/login'
    else  
      redirect_to '/posts'
    end
  end 

  def destroy
    session.delete :username
  end
end
