class AddPointsAndLevelToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :points, :integer
    add_column :users, :level, :integer
  end
end
