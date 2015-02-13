class Comment < ActiveRecord::Base
	include VoteableRkb
	
  belongs_to :post
  belongs_to :user, foreign_key: :user_id

  validates :body, presence: true

end