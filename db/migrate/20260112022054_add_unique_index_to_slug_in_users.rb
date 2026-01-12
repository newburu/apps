class AddUniqueIndexToSlugInUsers < ActiveRecord::Migration[8.1]
  def change
    add_index :users, :slug, unique: true
  end
end
