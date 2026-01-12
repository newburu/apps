class CreateProjects < ActiveRecord::Migration[8.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :url
      t.text :image_data
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
