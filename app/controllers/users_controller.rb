class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
    layout "post"

    def index
        @users = User.all
    end 

    def show
        @user = User.find(params[:id])
    end 

    def new
        @user = User.new
    end 

    def edit 
    end

    def create
        @user = User.create(user_params)
        redirect_to @user
    end 

    def update 
        @user.update(user_params)
        redirect_to @user
    end

    def destroy
        @user.destroy
    end

    private

    def set_user
        @user = current_user
    end

    def user_params
        params.require(:user).permit(:name, :bio, :image)
    end
end
