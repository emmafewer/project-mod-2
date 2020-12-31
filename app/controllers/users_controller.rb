class UsersController < ApplicationController
    def index
        @users = User.all
    end 

    def show
        @user = User.find_by(username: params[:username])
        session[:user_id] = @user.id
    end 

end
