class Pet < ApplicationRecord
  belongs_to :species
  belongs_to :user
  has_many :posts, through: :users

  validates_presence_of :name
  validates :age, numericality: {greater_than: 0}

  def self.oldest
    self.all.max_by{|pet| pet.age}
  end

  def self.youngest
    self.all.min_by{|pet| pet.age}
  end

  def self.most_common_name 
    self.all.max_by{|pet| pet.name}
  end

  # def self.check_name_count
  #   count = Pet.all.count(self.most_common_name.name)
  #   if count > 1
  #     self.most_common_name.name
  #   end
  # end

  def self.most_common_breed
    self.all.max_by{|pet| pet.breed}
  end

  def birthday

  end

end
