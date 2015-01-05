class AddsCommentToPostAndUser < ActiveRecord::Migration
  def change
    add_column :posts, :comment_id, :integer
    add_column :users, :comment_id, :integer
  end
end
