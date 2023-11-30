class AddFavoriteListIdToScenes < ActiveRecord::Migration[7.1]
  def change
    add_column :scenes, :favorite_list_id, :integer
    add_index :scenes, :favorite_list_id
  end
end
