class Pet < ApplicationRecord
  belongs_to :species
  belongs_to :user
  has_many :posts, through: :users

  # has_one :species
  # accepts_nested_attributes_for :species

  validates_presence_of :name
  validates :age, numericality: {greater_than: 0} 
end
