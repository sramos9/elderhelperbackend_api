class AddForeignKeyToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :elder_id, :integer
  end
end
