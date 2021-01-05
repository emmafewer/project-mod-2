class SpeciesController < ApplicationController
    def new
        @species = Species.new
    end

    def create
        @species = Species.create(species_params) 
    end

    private

    def species_params
        params.require(:species).permit(:name)
    end
end
