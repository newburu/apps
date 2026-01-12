class AddVisibleToProjects < ActiveRecord::Migration[8.1]
  def change
    add_column :projects, :visible, :boolean
  end
end
