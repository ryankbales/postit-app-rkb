class RemovePolymorphicColumns < ActiveRecord::Migration
  def change
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
    add_column :comments, :user_id, :integer
    add_column :comments, :post_id, :integer
    remove_column :users, :comment_id
    remove_column :posts, :comment_id
  end
end
