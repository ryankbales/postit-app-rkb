class Category < ActiveRecord::Base
  include Sluggable
  has_many :post_categories
  has_many :posts, through: :post_categories
  has_many :votes, as: :voteable
  
  validates :name, presence: true, length: {maximum: 50}

  sluggable_column :name

end