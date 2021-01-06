class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :pets, through: :users

  validates_presence_of :content

  def self.most_popular
      self.all.max_by{|post| post.likes}
  end

  def self.least_popular
      self.all.min_by{|post| post.likes}
  end 

  def self.most_comments
      self.all.max_by{|post| post.comments.size}
  end  

  def self.sorted_by_create_time
    self.all.order(created_at: :desc)
  end

end
