class Species < ApplicationRecord
    has_many :pets, :dependent => :destroy

end
