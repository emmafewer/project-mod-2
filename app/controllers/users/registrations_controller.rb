class Users::RegistrationsController < Devise::RegistrationsController

    def new
        super
    end

    def create
        super
    end

    def update
        super
    end

    def sign_up_params    
        params.require(resource_name).permit(:email, :password, :password_confirmation, :name, :bio, :image)
    end

    def account_update_params
        render :layout => "post"
        params.require(resource_name).permit(:email, :password, :password_confirmation, :current_password, :name, :bio, :image)
    end
end