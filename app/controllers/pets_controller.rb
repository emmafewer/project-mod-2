class PetsController < ApplicationController
    before_action :set_pet, only: [:show, :edit, :update, :destroy]
    layout "non_post"
    def index
        @pets = Pet.all
    end

    def show
    end

    def new 
        @pet = Pet.new
        @users = User.all
        @species = Species.all
    end

    def create
        # species = Species.find_or_create_by(name: params["species"]["name"])
        @pet = Pet.create(pet_params)

        #I think after making sessions work, we can set user_id = session[:user_id] instead of a collection select
        if @pet.valid?
            redirect_to @pet
        else
            flash[:errors] = @pet.errors.full_messages
            redirect_to new_pet_path
        end
    end

    def edit 
        @users = User.all
        @species = Species.all
    end

    def update
        @pet.update(pet_params)
        if @pet.valid?
            redirect_to @pet
        else
            flash[:errors] = @pet.errors.full_messages
            redirect_to edit_pet_path
        end
    end

    def destroy
        @pet.destroy
        redirect_to posts_path
    end

    private

    def set_pet
        @pet = Pet.find(params[:id])
    end

    def pet_params
        params.require(:pet).permit(:name, :age, :breed, :hobbies, :user_id, :species_id)
    end
end
