class AddAdressToPlace < ActiveRecord::Migration[7.1]
  def change
    add_column :places, :adress, :string
  end
end
