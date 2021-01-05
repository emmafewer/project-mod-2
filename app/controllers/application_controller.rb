class ApplicationController < ActionController::Base

    def most_pets
        @user = User.all.max_by{|user| user.pets.size}
    end

    def oldest_pet
        @pet = Pet.all.max_by{|pet| pet.age}
    end

    def youngest_pet
        @pet = Pet.all.min_by{|pet| pet.age}
    end

    def most_popular_post
        @post = Post.all.max_by{|post| post.likes}
    end

    def least_popular_post
        @post = Post.all.min_by{|post| post.likes}
    end 

    def most_comments_post
        @post = Post.all.max_by{|post| post.comments.size}
    end
end
