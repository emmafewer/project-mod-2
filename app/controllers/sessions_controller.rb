class SessionsController < ApplicationController
  def new
  end

  def create
    session[:username] = params[:username]
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id
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
