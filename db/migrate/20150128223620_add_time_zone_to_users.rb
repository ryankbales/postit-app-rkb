class AddTimeZoneToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :timezone, :datetime
  end
end
