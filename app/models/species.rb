class Species < ApplicationRecord
    has_many :pets, :dependent => :destroy

    def self.most_common
        self.all.max_by{|spec| spec.name}
    end

    def self.most_unique
        self.all.min_by{|spec| spec.name}
    end
end
