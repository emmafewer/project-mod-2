class User < ApplicationRecord
    has_many :pets, :dependent => :destroy
    has_many :posts, :dependent => :destroy
    has_many :comments

    def pet_count
        self.pets.size
    end

    def species 
        self.pets.each do |pet|
            pet.species.name
        end
    end

    def species_count
        counts = Hash.new
        self.pets.each do |pet|
            if !counts[pet.species.name]
                counts[pet.species.name] = 1
            else
                counts[pet.species.name] += 1
            end
        end
        counts
    end
end
