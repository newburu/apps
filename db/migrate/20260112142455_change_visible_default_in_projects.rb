class ChangeVisibleDefaultInProjects < ActiveRecord::Migration[8.1]
  def change
    Project.where(visible: nil).update_all(visible: true)
    change_column_default :projects, :visible, from: nil, to: true
    change_column_null :projects, :visible, false
  end
end
