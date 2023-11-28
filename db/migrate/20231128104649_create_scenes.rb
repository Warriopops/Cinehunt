class CreateScenes < ActiveRecord::Migration[7.1]
  def change
    create_table :scenes do |t|
      t.references :place, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :rating
      t.string :content
      t.float :price
      t.boolean :payant
      t.string :time
      t.string :link

      t.timestamps
    end
  end
end
