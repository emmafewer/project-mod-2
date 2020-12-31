class User < ApplicationRecord
    has_many :pets, :dependent => :destroy
    has_many :posts, :dependent => :destroy
end
