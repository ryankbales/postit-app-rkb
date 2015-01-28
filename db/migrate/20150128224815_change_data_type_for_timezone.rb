class ChangeDataTypeForTimezone < ActiveRecord::Migration
  def up
    change_column :users, :timezone, :string
  end

  def down
    change_column :users, :timezone, :datetime
  end
end
