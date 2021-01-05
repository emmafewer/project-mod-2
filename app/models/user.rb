class User < ApplicationRecord
    has_many :pets, :dependent => :destroy
    has_many :posts, :dependent => :destroy
    has_many :comments

    def pet_count
        self.pets.size
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

    def self.most_pets
        User.all.max_by{|user| user.pets.size}.name
    end
end
