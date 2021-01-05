class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :pets, through: :users

  validates_presence_of :title
  validates_presence_of :content

end
