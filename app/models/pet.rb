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

  def self.check_name_count
    self.all.count{|pet| Pet.most_common_name.name}
  end

  def self.most_common_breed
    self.all.max_by{|pet| pet.breed}
  end

  def self.check_breed_count
    self.all.count{|pet| pet.breed == Pet.most_common_breed}
  end

  def self.most_unique_species
    Pet.all.min_by{|pet| pet.species.name}
  end

  def self.most_unique_species_count
    Pet.all.count{|pet| pet.species.name == Pet.most_unique_species.species.name}
  end

  def self.most_common_species
    Pet.all.max_by{|pet| pet.species.name}
  end

  def self.most_common_species_count
    Pet.all.count{|pet| pet.species.name == Pet.most_common_species.species.name}
  end

  def birthday_formatted
    self.birthdate.strftime('%B %dth, %Y')
  end

  def self.birthdays_this_month
    pets_with_birthdays = Pet.all.select {|pet| pet.birthdate }
    pets_with_birthdays.select {|pet|pet.birthdate.month == DateTime.now.month}.sort_by {|pet|pet.birthdate.day}
  end

end
