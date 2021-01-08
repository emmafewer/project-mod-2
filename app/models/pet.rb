class Pet < ApplicationRecord
  belongs_to :species
  belongs_to :user
  has_many :posts, through: :users

  validates_presence_of :name
  validates :age, numericality: {greater_than_or_equal_to: 0}

  def self.oldest
    self.all.max_by{|pet| pet.age}
  end

  def self.youngest
    self.all.min_by{|pet| pet.age}
  end

  def self.most_unique_species
    Pet.all.min_by{|pet| pet.species.name}
  end

  def self.most_unique_species_count
    Pet.all.count{|pet| pet.species.name == Pet.most_unique_species.species.name}
  end

  def birthday_formatted
    self.birthdate.strftime('%B %dth, %Y')
  end

  def self.birthdays_this_month
    pets_with_birthdays = Pet.all.select {|pet| pet.birthdate }
    pets_with_birthdays.select {|pet|pet.birthdate.month == DateTime.now.month}.sort_by {|pet|pet.birthdate.day}
  end

  def self.name_count
    counts = Hash.new
    Pet.all.each do |pet|
        if !counts[pet.name]
            counts[pet.name] = 1
        else
            counts[pet.name] += 1
        end
    end
    counts
  end

  def self.most_common_name
    Pet.name_count.each {|k,v| return k if v == Pet.name_count.values.max}
  end

  def self.most_common_species_count
    counts = Hash.new
    Pet.all.each do |pet|
        if !counts[pet.species.name]
            counts[pet.species.name] = 1
        else
            counts[pet.species.name] += 1
        end
    end
    counts
  end

  def self.most_common_species
    Pet.most_common_species_count.each {|k,v| return k if v == Pet.most_common_species_count.values.max}
  end

  def self.check_breed_count
    counts = Hash.new
    Pet.all.each do |pet|
        if !counts[pet.breed]
            counts[pet.breed] = 1
        else
            counts[pet.breed] += 1
        end
    end
    counts
  end

  def self.most_common_breed
    Pet.check_breed_count.each {|k,v| return k if v == Pet.check_breed_count.values.max}
  end

end
