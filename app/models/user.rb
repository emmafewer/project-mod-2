class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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
        self.all.max_by{|user| user.pets.size}
    end

    def post_alert_criteria
        if self.posts.count != 0
            self.posts.last.created_at.strftime('%d').to_i - Time.now.strftime('%d').to_i
        else  
            0
        end
    end

    def last_post
        self.posts.last.created_at.strftime('%B %d %Y')
    end

    def no_pet
        self.pets.empty?
    end

    def complete_profile
        self.name.empty? || self.bio.empty? || self.image.empty?
    end

end
