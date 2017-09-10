class RemoveRequestedByFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :requested_by, :string
  end
end
