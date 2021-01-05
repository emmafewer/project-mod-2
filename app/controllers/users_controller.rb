class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    layout "non_post"

    def index
        @users = User.all
    end 

    def show
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
