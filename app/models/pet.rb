class Pet < ApplicationRecord
  belongs_to :species
  belongs_to :user
  has_many :posts, through: :users

  accepts_nested_attributes_for :species

  validates_presence_of :name
  validates :age, numericality: {greater_than: 0}

  # def species_attributes=(spec_attributes)
  #   spec_attributes.values.each do |spec_attribute|
  #     byebug
  #     if spec_attribute[:pet][:name] != ""
  #       spec = Species.find_or_create_by(spec_attributes)
  #       self.species << spec
  #     end
  #   end
  # end
end
